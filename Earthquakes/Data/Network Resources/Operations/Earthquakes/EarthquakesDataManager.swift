//
//  EarthquakesDataManager.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation
import RxSwift

protocol EarthquakesDataManager {
    func fetchEarthquakes(
        north: Double,
        east: Double, west: Double,
        south: Double
    ) -> Single<Result<EarthquakesRemote, Error>>
}

class EarthquakesDataManagerImpl: EarthquakesDataManager {
    
    private let queueManager: QueueManager
    
    init(queueManager: QueueManager = QueueManager.shared) {
        self.queueManager = queueManager
    }
    
    func fetchEarthquakes(
        north: Double,
        east: Double,
        west: Double,
        south: Double
    ) -> Single<Result<EarthquakesRemote, Error>> {
        return Single.create { emitter in
            let operation = FetchEarthquakesOperation(north, east, west, south)
            operation.completionHandler = { result in
                emitter(.success(result))
            }
            self.queueManager.enquqe(operation)
            return Disposables.create { }
        }
    }
}
