//
//  TaskInputModelProtocol.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 13..
//

import Foundation

protocol TaskInputModelProtocol: RootInputModelProtocol {
    var writtenData: Data? { get }
    var typedData: String? { get }
    var description: String? { get }
    var tags: [Tag] { get }
    var alertDate: Date? { get }
    var deadlineData: Date? { get }
}
