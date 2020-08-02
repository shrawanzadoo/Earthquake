import Foundation
@testable import Earthquakes

class MockEarthquakesViewContract: EarthquakesViewContract {
    var showLoadingCount = 0
    func showLoading() {
        showLoadingCount += 1
    }
    
    var hideLoadingCount = 0
    func hideLoading() {
        hideLoadingCount += 1
    }
    
    var updateEarthquakesCount = 0
    var updateEarthquakesParams: [[Earthquake]] = []
    func updateEarthquakes(earthquakes: [Earthquake]) {
        updateEarthquakesCount += 1
        updateEarthquakesParams.append(earthquakes)
    }
    
    var showAlertCount = 0
    var showAlertParams: [(
        title: String,
        message: String,
        mainActionTitle: String?,
        mainActionCallback: (() -> Void)?
        )] = []
    func showAlert(
        title: String,
        message: String,
        mainActionTitle: String?,
        mainActionCallback: (() -> Void)?
    ) {
        showAlertCount += 1
        showAlertParams.append((title, message, mainActionTitle, mainActionCallback))
    }
}
