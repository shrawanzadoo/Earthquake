import UIKit

extension UIViewController {
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
}
