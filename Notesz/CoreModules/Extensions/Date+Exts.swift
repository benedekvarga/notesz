//
//  Date+Exts.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 13..
//

import Foundation

extension Date {
    func formattedDateString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
