import UIKit

protocol EarthquakeViewControllerDelegate {
    func earthquakeSelected(_ earthquake: Earthquake)
    func earthquakeLoaded(_ earthquake: Earthquake)
}

class EarthquakeViewController: UITableViewController {
    
    var earthquakes = [Earthquake]()
    
    var delegate: EarthquakeViewControllerDelegate?
    internal let presenter: EarthquakesPresenterContract
    
    init(presenter: EarthquakesPresenterContract) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "Earthquakes"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        if let refreshControl = refreshControl {
            tableView.addSubview(refreshControl)
            refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        }
        
        tableView.registerTableViewCellNib(EarthquakeCell.self)
        
        self.presenter.takeView(self)
    }
    
    @objc private func refreshData(_ sender: Any) {
        presenter.reloadEarthquakes()
    }
}

