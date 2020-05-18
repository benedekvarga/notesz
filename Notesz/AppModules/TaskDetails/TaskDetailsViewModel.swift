//
//  TaskDetailsViewModel.swift
//  Notesz
//
//  Created by Varga Benedek on 2020. 05. 10..
//

import Combine
import Foundation

class TaskDetailsViewModel: RootViewModel, ObservableObject {
    @Published public var writtenData: Data?
    @Published public var typedData: String = ""
    @Published public var isCompleted: Bool = false
    @Published public var deadline: String = ""
    @Published public var penToolSelected: Bool = false
    @Published public var lineWidth: Double = 2

    private var task: Task
    private var subscriptions = Set<AnyCancellable>()
    @Published public var deadlineDate: Date?

    init(task: Task) {
        self.writtenData = task.writtenData
        self.typedData = task.typedData ?? ""
        self.penToolSelected = task.typedData == nil
        self.isCompleted = task.completed
        self.task = task
        self.deadlineDate = task.deadline

        super.init()
    }

    override func createBindings() {
        $writtenData
            .sink(receiveValue: { [weak self] data in
                self?.task.writtenData = data
            })
            .store(in: &subscriptions)

        $typedData
            .sink(receiveValue: { [weak self] data in
                self?.task.typedData = data
            })
            .store(in: &subscriptions)

        $isCompleted
            .sink(receiveValue: { [weak self] data in
                self?.task.completed = data
            })
            .store(in: &subscriptions)

        $lineWidth
            .sink(receiveValue: { data in
                print(data)
            })
            .store(in: &subscriptions)

        $deadlineDate
            .sink(receiveValue: { date in
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy. MM. dd."
                if let date = date {
                    self.deadline = dateFormatter.string(from: date)
                } else {
                    self.deadline = "nincs megadva"
                }
            })
            .store(in: &subscriptions)
    }
}
