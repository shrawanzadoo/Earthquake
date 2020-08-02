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

class MasterViewController: UITableViewController {
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    func showAlertWithAction(
        title: String?,
        message: String?,
        mainActionTitle: String?,
        mainActionCallback: (() -> Void)?
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        
        if let mainActionTitle = mainActionTitle,
            let mainActionCallback = mainActionCallback {
            let save = UIAlertAction(
                title: mainActionTitle,
                style: .default
            ) { (alertAction) in
                mainActionCallback()
            }
            alert.addAction(save)
        }
        
        let cancel = UIAlertAction(
            title: "Cancel",
            style: .default
        ) { (alertAction) in }
        alert.addAction(cancel)
        
        self.present(alert, animated:true, completion: nil)
    }
    
//    // MARK: - Segues
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = earthquakes[indexPath.row]
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
//                detailViewController = controller
//            }
//        }
//    }
    
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

