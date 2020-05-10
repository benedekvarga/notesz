//
//  TaskListViewModel.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//

import Combine

class TaskListViewModel: ObservableObject, Identifiable {
    // MARK: - Properties

    @Published var dataSource: [TaskCellViewModel]
    @Published var name: String

    private let tasks: [Task]

    // MARK: - Initialization

    init(name: String, tasks: [Task]) {
        self.name = name
        self.dataSource = tasks.map { TaskCellViewModel(task: $0) }
        self.tasks = tasks
    }

    // MARK: - Public functions

    public func newTask() {
        let task = Task(typedData: "", orderId: dataSource.count)
        let viewModel = TaskCellViewModel(task: task)
        dataSource.append(viewModel)
    }
}
