//
//  EarthquakePresenter.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 27/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation
import RxSwift

class EarthquakesPresenter: EarthquakesPresenterContract {
    
    var disposeBag = DisposeBag()
    let scheduler: SchedulerProvider
    
    let getEarthquakesUseCase: GetEarthquakes
    
    var view: EarthquakesViewContract?
    
    var earthquakes: [Earthquake]?
    
    let defaultLocation = GetEarthquakes.Q(
        north: 44.1,
        east: -22.4,
        west: 55.2,
        south: -9.9
    )
    
    let lastWeekDate = Calendar.current.date(
        byAdding: .weekOfYear,
        value: -1,
        to: Date()
    )
    
    init(
        scheduler: SchedulerProvider,
        getEarthquakesUseCase: GetEarthquakes
    ) {
        self.scheduler = scheduler
        self.getEarthquakesUseCase = getEarthquakesUseCase
    }
    
    
    //MARK: Presenter contracts
    func takeView(_ view: EarthquakesViewContract) {
        self.view = view
        reloadEarthquakes()
    }
    
    func reloadEarthquakes() {
        view?.showLoading()
        getEarthquakesUseCase.execute(defaultLocation)
            .subscribeOn(scheduler.io())
            .map { (response: Result<EarthquakesInfo, Error>) -> Result<[Earthquake], Error> in
                switch response {
                case .success(let earthquakes):
                    let uiEarthquakes = earthquakes.map {
                        Earthquake(
                            datetime: self.getFormattedDate($0.datetime),
                            lat: $0.lat,
                            lng: $0.lng,
                            magnitude: $0.magnitude,
                            depth: $0.depth,
                            intensity: $0.magnitude >= 8 ? .high : .low
                        )
                    }
                    return .success(uiEarthquakes)
                case .failure(let error):
                    return .failure(error)
                }
        }
        .observeOn(scheduler.ui())
        .subscribe(onNext: { response in
            self.view?.hideLoading()
            if let uiEarthquakes = self.processResponse(response) {
                self.earthquakes = uiEarthquakes
                self.view?.updateEarthquakes(earthquakes: uiEarthquakes)
            }
        }).disposed(by: disposeBag)
    }
    
    private func processResponse<T: Any>(
        _ response: Result<T, Error>
    ) -> T? {
        switch response {
        case .success(let result):
            return result
        case .failure(let error):
            handleError(error)
            return nil
        }
    }
    
    private func handleError(_ error: Error?) {
        var message = "Something went wrong"
        
        if let baseError = error as? BaseError {
            if case .noData = baseError {
                message = "Sorry, no data found. Please check your Internet connction."
            } else if case .parsingError = baseError {
                message = "Looks like data is malformed."
            }
        }
        
        self.view?.showAlert(
            title: "Oops!",
            message: message,
            mainActionTitle: nil,
            mainActionCallback: nil
        )
    }
    
    private func getFormattedDate(_ date: Date?) -> String {
        guard let date = date else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: date)
    }
}
