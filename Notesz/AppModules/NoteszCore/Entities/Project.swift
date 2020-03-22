//
//  Project.swift
//  TaskCore
//
//  Created by Benedek Varga on 2019. 02. 18..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation

struct Project: Taggable, Ordered {
    public var name: String
    public var completed: Bool
    public var orderId: Int
    public var creationDate: Date
    public var tasks: [Task]?
    public var alertDate: Date?
    public var deadline: Date?
    public var tags: [Tag]?
}

extension Project {
    public init(name: String, completed: Bool = false, orderId: Int, creationDate: Date = Date()) {
        self.name = name
        self.completed = completed
        self.orderId = orderId
        self.creationDate = creationDate
    }
}

extension Project {
    public var duration: Int {
        var count = 0
        tasks?.forEach {
            count += ($0.duration ?? 0)
        }
        return count
    }
}
