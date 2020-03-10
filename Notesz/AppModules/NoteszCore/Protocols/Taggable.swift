//
//  Taggable.swift
//  TaskCore
//
//  Created by Benedek Varga on 2019. 02. 24..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation

protocol Taggable {
    var tags: [Tag]? { get }
}
