import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UISplitViewControllerDelegate, EarthquakeViewControllerDelegate {
    
    var window: UIWindow?
    
    var masterVC: EarthquakeViewController?
    var detailVC: EarthquakeDetailViewController?
    var splitViewController: UISplitViewController?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        
        guard let window = window else { return }
        splitViewController = UISplitViewController()
        
        masterVC = EarthquakeInjection().resolve()
        detailVC = EarthquakeInjection().resolve()
        
        if let splitViewController = splitViewController,
            let masterVC = masterVC,
            let detailVC = detailVC {
            splitViewController.delegate = self
            splitViewController.preferredDisplayMode = .automatic
            
            detailVC.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            detailVC.navigationItem.leftItemsSupplementBackButton = true
            
            let masterNavController = UINavigationController(rootViewController: masterVC)
            let detailNavController = UINavigationController(rootViewController: detailVC)
            splitViewController.viewControllers = [masterNavController, detailNavController]
            
            masterVC.delegate = self
        }
        window.rootViewController = splitViewController
    }
    
    func earthquakeSelected(_ earthquake: Earthquake) {
        if let detailVC = detailVC {
            detailVC.detailItem = earthquake
            splitViewController?.showDetailViewController(UINavigationController(rootViewController: detailVC), sender: masterVC)
        }
    }
    
    func earthquakeLoaded(_ earthquake: Earthquake) {
        detailVC?.detailItem = earthquake
    }
    
    // MARK: - Split view
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController
    ) -> Bool {
        return true
    }
    
}

