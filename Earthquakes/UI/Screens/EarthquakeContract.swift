//
//  EarthquakeContract.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 27/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation

protocol EarthquakesPresenterContract {
    func takeView(_ view: EarthquakesViewContract)
    func reloadEarthquakesAt()
}

protocol EarthquakesViewContract {
    func showLoading()
    func hideLoading()
    func updateEarthquakes(earthquakes: [Earthquake])
    func showAlert(
        title: String,
        message: String,
        mainActionTitle: String?,
        mainActionCallback: (() -> Void)?
    )
}
