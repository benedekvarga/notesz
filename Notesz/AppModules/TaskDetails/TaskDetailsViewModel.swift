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
    @Published public var typedData: String
    @Published public var isCompleted: Bool
    @Published public var penToolSelected: Bool
    @Published public var lineWidth: Double = 2

    private var task: Task
    private var subscriptions = Set<AnyCancellable>()

    init(task: Task) {
        self.writtenData = task.writtenData
        self.typedData = task.typedData ?? ""
        self.penToolSelected = task.typedData == nil
        self.isCompleted = task.completed
        self.task = task

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
            .sink(receiveValue: { [weak self] data in
                print(data)
            })
            .store(in: &subscriptions)
    }
}
