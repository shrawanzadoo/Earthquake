//
//  MasterViewController.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import UIKit

protocol EarthquakeViewControllerDelegate {
    func earthquakeSelected(_ earthquake: Earthquake)
    func earthquakeLoaded(_ earthquake: Earthquake)
}

class EarthquakeViewController: UITableViewController {
    
    let cellIdentifier = "MasterCells"
    var detailViewController: EarthquakeDetailViewController? = nil
    var earthquakes = [Earthquake]()
    
    var delegate: EarthquakeViewControllerDelegate?
    internal let presenter: EarthquakesPresenterContract
    
    init(presenter: EarthquakesPresenterContract) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "Earthquakes"
        self.presenter.takeView(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count - 1] as? UINavigationController)?.topViewController as? EarthquakeDetailViewController
        }
        
        refreshControl = UIRefreshControl()
        if let refreshControl = refreshControl {
            tableView.addSubview(refreshControl)
            refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        }
    }
    
    @objc private func refreshData(_ sender: Any) {
        presenter.reloadEarthquakesAt()
    }
}

