//
//  TaskInputModel.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 13..
//

import Foundation

struct TaskInputModel: TaskInputModelProtocol {
    // MARK: - TaskInputModelProtocol properties

    var writtenData: Data?
    var typedData: String?
    var tags: [Tag]
    var alertDate: Date?
    var deadlineData: Date?
}

extension TaskInputModel {
    init() {
        self.writtenData = nil
        self.typedData = nil
        self.tags = []
        self.alertDate = nil
        self.deadlineData = nil
    }
}
