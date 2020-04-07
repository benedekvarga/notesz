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

    func htmlAttributed(font: UIFont, size: CGFloat, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
                "color: #\(color.hexString!) !important;" +
                "font-family: \(font.familyName), Helvetica !important;" +
            "}</style> \(self)"

            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }

            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}
