//
//  Injection.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 27/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation

protocol EarthquakeAssembler {
    func resolve() -> EarthquakeViewController
    func resolve() -> EarthquakeDetailViewController
    func resolve() -> EarthquakesPresenterContract
    func resolve() -> SchedulerProvider
    func resolve() -> GetEarthquakes
}

extension EarthquakeAssembler {
    func resolve() -> EarthquakeViewController {
        EarthquakeViewController(presenter: resolve())
    }
    
    func resolve() -> EarthquakeDetailViewController {
        EarthquakeDetailViewController()
    }
    
    func resolve() -> EarthquakesPresenterContract {
        EarthquakesPresenter(scheduler: resolve(), getEarthquakesUseCase: resolve())
    }
    
    func resolve() -> SchedulerProvider {
        AppSchedulerProvider()
    }
    
    func resolve() -> GetEarthquakes {
        GetEarthquakes()
    }
}

class EarthquakeInjection: EarthquakeAssembler { }
