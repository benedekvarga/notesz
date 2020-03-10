//
//  Group.swift
//  TaskCore
//
//  Created by Benedek Varga on 2019. 02. 23..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation

struct Group: Taggable, Ordered {
    public var name: String
    public var orderId: Int
    public var creationDate: Date
    
    public var projects: [Project]?
    public var tasks: [Task]?
    public var tags: [Tag]?
}

extension Group {
    public init(name: String, orderId: Int, creationDate: Date = Date()) {
        self.name = name
        self.orderId = orderId
        self.creationDate = creationDate
    }
}

extension Group {
    public var duration: Int {
        get {
            var count = 0
            tasks?.forEach {
                count += ($0.duration ?? 0)
            }
            projects?.forEach {
                count += ($0.duration)
            }
            return count
        }
    }
}
