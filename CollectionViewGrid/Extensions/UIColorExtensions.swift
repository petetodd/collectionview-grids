//
//  UIColorExtensions.swift

//

import UIKit

extension UIColor {
    /**
     * Returns random color
     * EXAMPLE: self.backgroundColor = UIColor.random
     * REF: https://stackoverflow.com/questions/29779128/how-to-make-a-random-color-with-swift/51608874#51608874
     */
    static var random: UIColor {
        let r:CGFloat  = .random(in: 0 ... 1)
        let g:CGFloat  = .random(in: 0 ... 1)
        let b:CGFloat  = .random(in: 0 ... 1)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}
