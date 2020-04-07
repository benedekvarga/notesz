//
//  Double.swift
//
//  Created by Benedek Varga on 2019. 03. 04..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    var cgFloat: CGFloat { return CGFloat(self) }
    var int: Int { return Int(self) }
    var formattedNumericString: String { return NumberFormatter.formatter.string(from: NSNumber(value: self)) ?? "" }

    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
