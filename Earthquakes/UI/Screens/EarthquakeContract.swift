import Foundation

protocol EarthquakesPresenterContract {
    func takeView(_ view: EarthquakesViewContract)
    func reloadEarthquakes()
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
