//
//  EarthquakesDataManager.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation

protocol EarthquakesDataManager {
    func fetchEarthquakes(
        north: Double,
        east: Double, west: Double,
        south: Double,
        completion: @escaping (_ result: Result<EarthquakesRemote, Error>
    ) -> Void)
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
        south: Double,
        completion: @escaping (_ result: Result<EarthquakesRemote, Error>) -> Void
    ) {
            let operation = FetchEarthquakesOperation(north, east, west, south)
            operation.completionHandler = { result in
                completion(result)
            }
            self.queueManager.enquqe(operation)
    }
}
