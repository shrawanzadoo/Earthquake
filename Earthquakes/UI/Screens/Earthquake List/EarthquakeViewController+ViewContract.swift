import UIKit

extension EarthquakeViewController: EarthquakesViewContract {
    func showLoading() {
        refreshControl?.beginRefreshing()
    }
    
    func hideLoading() {
        refreshControl?.endRefreshing()
    }
    
    func updateEarthquakes(earthquakes: [Earthquake]) {
        self.earthquakes = earthquakes
        tableView.reloadData()
        if let first = earthquakes.first {
            delegate?.earthquakeLoaded(first)
        }
    }
    
    func showAlert(title: String, message: String, mainActionTitle: String?, mainActionCallback: (() -> Void)?) {
        showAlertWithAction(title: title, message: message, mainActionTitle: mainActionTitle, mainActionCallback: mainActionCallback)
    }
    
    
}
