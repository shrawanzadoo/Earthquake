import UIKit

class EarthquakeCell: UITableViewCell {
    @IBOutlet private weak var magnitudeView: UIView!
    @IBOutlet private weak var magnitude: UILabel!
    @IBOutlet private weak var identifier: UILabel!
    
    func configureCellWith(model: Earthquake) {
        magnitudeView.backgroundColor = model.intensity.getColor()
        magnitude.text = "\(model.magnitude)"
        identifier.text = model.id
        
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        selectedBackgroundView = view
    }

}
