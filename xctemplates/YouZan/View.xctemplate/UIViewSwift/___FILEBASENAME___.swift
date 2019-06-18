//___FILEHEADER___

import UIKit
import TangramKit

class ___FILEBASENAMEASIDENTIFIER___: UIView {

    // MARK: - Init
    fileprivate(set) var layout: TGBaseLayout!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return layout.sizeThatFits(size)
    }
}

// MARK: - Public Methods
extension ___FILEBASENAMEASIDENTIFIER___ {

}

// MARK: - Event
extension ___FILEBASENAMEASIDENTIFIER___ {

}

// MARK: - Private Methods
private extension ___FILEBASENAMEASIDENTIFIER___ {
    func setupUI() {

    }

}
