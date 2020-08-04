import UIKit
import MapKit

class EarthquakeDetailViewController: UIViewController {

    @IBOutlet private var mapView: MKMapView!
    @IBOutlet var magnitudeView: UIView!
    @IBOutlet var magnitudeLabel: UILabel!
    @IBOutlet var depthLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var srcLabel: UILabel!

    func configureView() {
        if let detail = detailItem {
            if let magnitudeLabel = magnitudeLabel {
                magnitudeLabel.text = "Magnitude : \(detail.magnitude)"
                magnitudeView.backgroundColor = detail.intensity.getColor()
                depthLabel.text = "Depth : \(detail.depth)km"
                dateLabel.text = "Date : \(detail.datetime)"
                idLabel.text = "Eqid: \(detail.id)"
                srcLabel.text = "Src: \(detail.source)"
                mapView.centerToLocation(detail.lat, detail.lng)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        navigationItem.title = "Earthquake details"
    }

    var detailItem: Earthquake? {
        didSet {
            configureView()
        }
    }
}

