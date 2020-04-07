//
//  System.swift
//  Utility
//
//  Created by Benedek Varga on 2019. 02. 16..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import UIKit

public enum System {
    public static let appVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "N/A"
    public static let buildNumber: Int = Int(Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "0") ?? 0
    public static let longVersion: String = "\(System.appVersion) (\(System.buildNumber))"
    public static let OSVersion: String = UIDevice.current.systemVersion
    public static let OSVersionPrefix: String = "iOS \(OSVersion)"
    public static var deviceName: String { return UIDevice.current.name }
}
