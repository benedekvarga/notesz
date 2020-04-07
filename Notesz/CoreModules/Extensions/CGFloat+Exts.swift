//
//  CGFloat.swift
//  Utility
//
//  Created by Benedek Varga on 2019. 03. 04..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    var int: Int { return Int(self) }
    var double: Double { return Double(self) }
    var formattedNumericString: String { return NumberFormatter.formatter.string(from: NSNumber(value: self.double)) ?? "" }

    func rounded(toPlaces places: Int) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        return (self * divisor).rounded() / divisor
    }
}
