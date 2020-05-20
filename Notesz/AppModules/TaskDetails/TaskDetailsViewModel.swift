//
//  TaskDetailsViewModel.swift
//  Notesz
//
//  Created by Varga Benedek on 2020. 05. 10..
//

import Combine
import Foundation
import SwiftUI

class TaskDetailsViewModel: ObservableObject {
    // MARK: - Properties

    private var subscriptions = Set<AnyCancellable>()
    private var dateFormatter = DateFormatter()
    @Published private var task: Task

    @Published public var project: Project
    @Published public var group: Group
    @Published public var duration = ""
    @Published public var writtenData: Data?
    @Published public var typedData = ""
    @Published public var isCompleted = false
    @Published public var penToolSelected = false
    @Published public var lineColor = UIColor.black
    @Published public var lineWidth: CGFloat = 2
    @Published public var isEraserSelected = false
    @Published public var shouldClearCanvas = 0
    @Published public var deadlineText: String = ""
    @Published public var deadlineDate = Date()

    init(task: Task, project: Project, group: Group) {
        self.task = task
        self.project = project
        self.group = group
        self.dateFormatter.dateFormat = "yyyy. MM. dd."
        binds()
    }

    private func binds() {
        $task
        .sink(receiveValue: { [weak self] task in
            guard let self = self else { return }

            self.duration = "\(task.duration ?? 0) perc"
            self.writtenData = task.writtenData
            self.typedData = task.typedData ?? ""
            self.isCompleted = task.completed
            if let date = task.deadline {
                self.deadlineDate = date
            } else {
                self.deadlineText = "nincs megadva"
            }
        })
        .store(in: &subscriptions)

        $deadlineDate
        .dropFirst()
        .sink(receiveValue: { [weak self] date in
            guard let self = self else { return }

            self.deadlineText = self.dateFormatter.string(from: date)
        })
        .store(in: &subscriptions)
    }
}
