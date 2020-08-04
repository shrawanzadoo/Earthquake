import UIKit

extension UIView {
    static func loadFromNib(_ nibNameOrNil: String? = nil) -> Self? {
      let nibName = nibNameOrNil ?? self.className
      let nib = UINib(nibName: nibName, bundle: nil)
      return nib.instantiate(withOwner: self, options: nil).first as? Self
    }

    static fileprivate var className: String {
      let className = "\(self)"
      let components = className.split { $0 == "." }.map(String.init)
      return components.last!
    }
}
