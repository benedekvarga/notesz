//
//  TaskListViewModel.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//

import Combine

class TaskListViewModel: ObservableObject, Identifiable {
    // MARK: - Properties

    @Published var dataSource: [TaskViewModel]
    @Published var name: String

    // MARK: - Initialization

    init(name: String, tasks: [Task]) {
        self.name = name
        self.dataSource = tasks.map { TaskViewModel(
            inputModel: TaskInputModel(
                writtenData: $0.writtenData,
                typedData: $0.typedData,
                tags: $0.tags,
                alertDate: $0.alertDate,
                deadlineData: $0.alertDate)
            )
        }
    }

    // MARK: - Public functions

    public func newTask() {
        let inputModel = TaskInputModel()
        let viewModel = TaskViewModel(inputModel: inputModel)
        dataSource.append(viewModel)
    }
}
