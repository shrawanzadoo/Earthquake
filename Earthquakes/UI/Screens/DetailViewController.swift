//
//  DetailViewController.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    func configureView() {
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                navigationItem.title = "Earthquake \(detail.depth)"
                label.text = "\(detail.magnitude)"
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

