//___FILEHEADER___

import UIKit
import TangramKit

class ___FILEBASENAMEASIDENTIFIER___: UITableViewCell {

    // MARK: - Init
    fileprivate(set) var layout: TGBaseLayout!

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return layout.sizeThatFits(targetSize)
    }

    // MARK: - Accessor

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
