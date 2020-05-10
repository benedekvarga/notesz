//
//  TaskCellViewModel.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//
import Combine
import Foundation

class TaskCellViewModel: RootViewModel, ObservableObject, Identifiable {
    // MARK: - Properties

    @Published public var writtenData: Data?
    @Published public var typedData: String
    @Published public var isCompleted = false
    @Published public var penToolSelected: Bool
    @Published public var showDetails = false

    var task: Task
    private var subscriptions = Set<AnyCancellable>()

    init(task: Task) {
        self.writtenData = task.writtenData
        self.typedData = task.typedData ?? ""
        self.penToolSelected = task.typedData == nil
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
    }
}
