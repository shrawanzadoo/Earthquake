//
//  EarthquakeDetailViewController.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import UIKit
import MapKit

class EarthquakeDetailViewController: UIViewController {

    @IBOutlet private var mapView: MKMapView!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    func configureView() {
        if let detail = detailItem {
            if let magnitudeLabel = magnitudeLabel {
                magnitudeLabel.text = "Magnitude : \(detail.magnitude)"
                depthLabel.text = "Depth : \(detail.depth)km"
                dateLabel.text = "Date : \(detail.datetime)"
                mapView.centerToLocation(detail.lat, detail.lng)
                view.backgroundColor = detail.intensity == .high ? .systemRed : .systemOrange
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

