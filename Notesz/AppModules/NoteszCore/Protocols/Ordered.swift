//
//  Ordered.swift
//  TaskCore
//
//  Created by Benedek Varga on 2019. 02. 24..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation

public protocol Ordered {
    var orderId: Int { get set }
    var creationDate: Date { get set }
}

extension Array where Element:Ordered {
    func orderedById(ascending: Bool) -> [Ordered] {
        if ascending {
            return self.sorted(by: { $0.orderId == $1.orderId ? $0.creationDate < $1.creationDate : $0.orderId < $1.orderId } )
        } else {
            return self.sorted(by: { $0.orderId == $1.orderId ? $0.creationDate > $1.creationDate : $0.orderId > $1.orderId } )
        }
    }

    func orderedByDate(ascending: Bool) -> [Ordered] {
        if ascending {
            return self.sorted(by: { $0.creationDate == $1.creationDate ? $0.orderId < $1.orderId : $0.creationDate < $1.creationDate } )
        } else {
            return self.sorted(by: { $0.creationDate == $1.creationDate ? $0.orderId > $1.orderId : $0.creationDate > $1.creationDate })
        }
    }

    mutating func orderedInsert(_ newElement: Element) {
        self.insert(newElement, at: newElement.orderId)
        for i in newElement.orderId + 1..<self.count {
            self[i].orderId += 1
        }
    }
}
