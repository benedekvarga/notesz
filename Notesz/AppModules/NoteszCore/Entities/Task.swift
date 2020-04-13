//
//  Task.swift
//  TaskCore
//
//  Created by Benedek Varga on 2019. 02. 18..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation

struct Task: Taggable, Ordered {
    public var writtenData: Data?
    public var typedData: String?
    public var description: String?
    public var completed: Bool
    public var creationDate: Date
    public var orderId: Int
    public var duration: Int?
    public var alertDate: Date?
    public var deadline: Date?
    public var tags: [Tag]?
}

// MARK: - Inits

extension Task {
    public init(completed: Bool = false, description: String, orderId: Int, creationDate: Date = Date()) {
        self.completed = completed
        self.description = description
        self.orderId = orderId
        self.creationDate = creationDate
    }
}

// MARK: - Computed properties

extension Task {
    var isOverdue: Bool? {
        guard let deadline = deadline else { return nil }
        return deadline < Date()
    }

    var remainingTime: (Int, TimeIntervals)? {
        guard let remaining = deadline?.timeIntervalSinceNow.magnitude else { return nil }
        if remaining / 60.0 < 1 {
            return (Int(round(remaining)), .sec )
        }
        if remaining / 3600.0 < 1 {
            return (Int(round(remaining / 60.0)), .minute )
        }
        if remaining / 86400.0 < 1 {
            return (Int(round(remaining / 3600.0)), .hour)
        }
        if remaining / 604800.0 < 1 {
            return (Int(round(remaining / 86400.0)), .day)
        }
        if remaining / 2592000.0 < 1 {
            return (Int(round(remaining / 604800.0)), .week)
        }
        if remaining / 31536000.0 < 1 {
            return (Int(round(remaining / 2592000.0)), .month)
        }
        return (Int(round(remaining / 31536000.0)), .year)
    }
}
