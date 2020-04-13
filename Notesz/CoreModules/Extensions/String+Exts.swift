//
//  String.swift
//
//  Created by Benedek Varga on 2019. 03. 04..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var double: Double? { return Double(self) }
    var int: Int? { return Int(self) }
    var cgFloat: CGFloat? { return CGFloat(self.double ?? 0.0) }

    var localized: String {
        return NSLocalizedString(self, tableName: "Localized", bundle: Bundle.main, value: "", comment: "")
    }
}
