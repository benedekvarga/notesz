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
    public var completed: Bool
    public var creationDate: Date
    public var orderId: Int
    public var duration: Int?
    public var deadline: Date?
    public var tags: [Tag]

    public init(typedData: String, completed: Bool = false, orderId: Int, creationDate: Date = Date()) {
        self.typedData = typedData
        self.completed = completed
        self.orderId = orderId
        self.creationDate = creationDate
        self.tags = []
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

extension Task: Hashable, Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return
            lhs.writtenData == rhs.writtenData &&
            lhs.typedData == rhs.typedData &&
            lhs.completed == rhs.completed &&
            lhs.creationDate == rhs.creationDate &&
            lhs.orderId == rhs.orderId &&
            lhs.duration == rhs.duration &&
            lhs.deadline == rhs.deadline &&
            lhs.tags == rhs.tags
    }
}
