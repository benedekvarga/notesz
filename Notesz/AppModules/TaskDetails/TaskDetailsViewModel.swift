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

    @Published public var task: Task
    @Published public var project: Project
    @Published public var group: Group
    @Published public var duration = ""
    @Published public var writtenData: Data?
    @Published public var typedData = ""
    @Published public var isCompleted = false
    @Published public var penToolSelected: Bool
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

        self.writtenData = task.writtenData
        self.typedData = task.typedData ?? ""
        self.isCompleted = task.completed
        if let date = task.deadline {
            self.deadlineDate = date
        }

        self.penToolSelected = task.writtenData != nil

        self.dateFormatter.dateFormat = "yyyy. MM. dd."
        binds()
    }

    private func binds() {
        $writtenData
        .sink(receiveValue: { [weak self] data in
            guard let self = self else { return }

            self.task.writtenData = data
        })
        .store(in: &subscriptions)

        $typedData
        .sink(receiveValue: { [weak self] data in
            guard let self = self else { return }

            self.task.typedData = data
        })
        .store(in: &subscriptions)

        $isCompleted
        .sink(receiveValue: { [weak self] data in
            guard let self = self else { return }

            self.task.completed = data
        })
        .store(in: &subscriptions)

        $deadlineDate
        .sink(receiveValue: { [weak self] data in
            guard let self = self else { return }

            self.task.deadline = data
        })
        .store(in: &subscriptions)

        $task
            .sink(receiveValue: { [weak self] task in
                guard let self = self else { return }
                print("update task")
                DataBase.shared.update(task: task, projectId: self.project.orderId, groupId: self.group.orderId)
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
