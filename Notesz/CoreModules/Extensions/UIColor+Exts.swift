//
//  UIColor+Exts.swift
//
//  Created by Benedek Varga on 2020. 03. 26..
//  Copyright © 2020. Benedek Varga. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(hex: String) {
        var cleanHexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cleanHexString.hasPrefix("#") {
            cleanHexString.remove(at: cleanHexString.startIndex)
        }

        guard cleanHexString.count == 6 else {
            self.init(red: 1, green: 1, blue: 1, alpha: 1)
            return
        }

        var rgb = UInt32()
        Scanner(string: cleanHexString).scanHexInt32(&rgb)

        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1
        )
    }

    var hexString: String? {
        if let components = self.cgColor.components {
            let red = components[0]
            let green = components[1]
            let blue = components[2]
            return String(format: "%02X%02X%02X", (Int(red * 255)), (Int(green * 255)), (Int(blue * 255)))
        }
        return nil
    }
}
