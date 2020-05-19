//
//  TaskCellViewModel.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//
import Combine
import Foundation

class TaskCellViewModel: ObservableObject, Identifiable {
    // MARK: - Properties

    private var subscriptions = Set<AnyCancellable>()

    @Published public var task: Task
    @Published public var project: String
    @Published public var writtenData: Data?
    @Published public var typedData: String = ""
    @Published public var isCompleted = false
    @Published public var penToolSelected: Bool
    @Published public var showDetails = false

    init(task: Task, project: String) {
        self.task = task
        self.penToolSelected = task.writtenData != nil
        self.project = project

        binds()
    }

    // MARK: - Functions

    private func binds() {
        $task
        .sink(receiveValue: { [weak self] task in
            guard let self = self else { return }

            self.writtenData = task.writtenData
            self.typedData = task.typedData ?? ""
            self.isCompleted = task.completed
        })
        .store(in: &subscriptions)
    }
}
