//
//  EarthquakesRepositoryTest.swift
//  EarthquakesTests
//
//  Created by Shrawan Zadoo on 02/08/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import XCTest
import RxSwift
@testable import Earthquakes

class EarthquakesRepositoryTest: XCTestCase {
    var disposeBag: DisposeBag!
    
    override func setUp() {
        disposeBag = DisposeBag()
    }
    
    func testEarthquakesRepositorySuccess() {

        let dataSource = MockEarthquakesDataSource()
        dataSource.fetchEarthquakesReturn = Single.just(.success(MockDataHelper.getData()))
        
        let repo = EarthquakesRepositoryImpl(dataSources: [dataSource])
        _ = repo.getEathquakes(north: 0, east: 0, west: 0, south: 0)
            .subscribe(onNext: { result in
                switch(result) {
                case .success(let earthquakes):
                    // verify data
                    XCTAssertEqual(3, earthquakes.count)
                case .failure(_):
                    XCTFail()
                }
            }).disposed(by: disposeBag)
        
        // verify data source method called
        XCTAssertEqual(1, dataSource.fetchEarthquakesCount)
    }
    
    func testEarthquakesRepositoryNoDataFailure() {

        let dataSource = MockEarthquakesDataSource()
        dataSource.fetchEarthquakesReturn = Single.just(.failure(BaseError.noData))
        
        let repo = EarthquakesRepositoryImpl(dataSources: [dataSource])
        _ = repo.getEathquakes(north: 0, east: 0, west: 0, south: 0)
            .subscribe(onNext: { result in
                switch(result) {
                case .success(_):
                    XCTFail()
                case .failure(let error):
                    // verify error
                    XCTAssertEqual(BaseError.noData, error as! BaseError)
                }
            }).disposed(by: disposeBag)
        
        // verify data source method called
        XCTAssertEqual(1, dataSource.fetchEarthquakesCount)
    }
    
    func testEarthquakesRepositoryParsingErrorFailure() {

        let dataSource = MockEarthquakesDataSource()
        dataSource.fetchEarthquakesReturn = Single.just(.failure(BaseError.parsingError))
        
        let repo = EarthquakesRepositoryImpl(dataSources: [dataSource])
        _ = repo.getEathquakes(north: 0, east: 0, west: 0, south: 0)
            .subscribe(onNext: { result in
                switch(result) {
                case .success(_):
                    XCTFail()
                case .failure(let error):
                    // verify error
                    XCTAssertEqual(BaseError.parsingError, error as! BaseError)
                }
            }).disposed(by: disposeBag)
        
        // verify data source method called
        XCTAssertEqual(1, dataSource.fetchEarthquakesCount)
    }
    
}
