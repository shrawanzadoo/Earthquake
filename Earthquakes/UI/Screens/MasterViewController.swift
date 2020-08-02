//
//  MasterViewController.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import UIKit

protocol MasterViewControllerDelegate {
    func earthquakeSelected(_ earthquake: Earthquake)
    func earthquakeLoaded(_ earthquake: Earthquake)
}

class EarthquakeViewController: UITableViewController {
    
    let cellIdentifier = "MasterCells"
    var detailViewController: DetailViewController? = nil
    var earthquakes = [Earthquake]()
    
    var delegate: MasterViewControllerDelegate?
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
            detailViewController = (controllers[controllers.count - 1] as? UINavigationController)?.topViewController as? DetailViewController
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
    
    
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
            let view = UIView(frame: .zero)
            view.backgroundColor = .systemTeal
            cell.selectedBackgroundView = view
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .white
        }
        cell.textLabel?.text = "\(earthquakes[indexPath.row].magnitude)"
        cell.detailTextLabel?.text = "\(earthquakes[indexPath.row].intensity)"
        cell.backgroundColor = earthquakes[indexPath.row].intensity == .high ? .systemRed : .systemOrange
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.earthquakeSelected(earthquakes[indexPath.row])
    }
}

