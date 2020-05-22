//
//  Group.swift
//  TaskCore
//
//  Created by Benedek Varga on 2019. 02. 23..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation

struct Group: Ordered {
    public var name: String
    public var orderId: Int
    public var creationDate: Date
    public var projects: [Project]

    public init(name: String, orderId: Int, creationDate: Date = Date(), projects: [Project]) {
        self.name = name
        self.orderId = orderId
        self.creationDate = creationDate
        self.projects = projects
    }

    public var duration: Int {
        var count = 0
        projects.forEach {
            count += ($0.duration)
        }
        return count
    }
}

extension Group: Hashable, Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.orderId == rhs.orderId &&
            lhs.creationDate == rhs.creationDate &&
            lhs.projects == rhs.projects
    }
}
