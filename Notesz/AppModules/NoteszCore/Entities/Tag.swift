//
//  Tag.swift
//  TaskCore
//
//  Created by Benedek Varga on 2019. 02. 23..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation
import UIKit

struct Tag {
    public var name: String
    public var redComponent: Int
    public var greenComponent: Int
    public var blueComponent: Int
}

extension Tag {
    public var color: UIColor {
        get {
            return UIColor(red: CGFloat(redComponent)/255.0, green: CGFloat(greenComponent)/255.0, blue: CGFloat(blueComponent)/255.0, alpha: 1.0)
        }
    }
}
