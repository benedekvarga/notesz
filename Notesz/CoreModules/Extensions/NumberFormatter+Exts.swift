//
//  NumberFormatter.swift
//
//  Created by Benedek Varga on 2019. 03. 04..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
}
