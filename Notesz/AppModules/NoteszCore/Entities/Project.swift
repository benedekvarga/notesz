//
//  Project.swift
//  TaskCore
//
//  Created by Benedek Varga on 2019. 02. 18..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation

struct Project: Ordered {
    public var name: String
    public var orderId: Int
    public var creationDate: Date
    public var tasks: [Task]

    public init(name: String, orderId: Int, creationDate: Date = Date(), tasks: [Task]) {
        self.name = name
        self.orderId = orderId
        self.creationDate = creationDate
        self.tasks = tasks
    }
}

extension Project {
    public var duration: Int {
        var count = 0
        tasks.forEach {
            count += ($0.duration ?? 0)
        }
        return count
    }
}

extension Project: Hashable, Equatable {
    static func == (lhs: Project, rhs: Project) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.orderId == rhs.orderId &&
            lhs.creationDate == rhs.creationDate &&
            lhs.tasks == rhs.tasks
    }
}
