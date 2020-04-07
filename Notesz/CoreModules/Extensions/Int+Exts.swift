//
//  Int.swift
//
//  Created by Benedek Varga on 2019. 03. 04..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    var cgFloat: CGFloat { return CGFloat(self) }
    var double: Double { return Double(self) }
    var formattedNumericString: String { return NumberFormatter.formatter.string(from: NSNumber(value: self)) ?? "" }
}
