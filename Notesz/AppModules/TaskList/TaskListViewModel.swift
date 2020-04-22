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

    // MARK: - Initialization

    init() {
        self.dataSource = [
            TaskViewModel(inputModel:
                TaskInputModel(
                    writtenData: nil,
                    typedData: nil,
                    tags: [],
                    alertDate: nil,
                    deadlineData: nil)
            ),
            TaskViewModel(inputModel:
                TaskInputModel(
                    writtenData: nil,
                    typedData: nil,
                    tags: [],
                    alertDate: nil,
                    deadlineData: nil)
            ),
            TaskViewModel(inputModel:
                TaskInputModel(
                    writtenData: nil,
                    typedData: nil,
                    tags: [],
                    alertDate: nil,
                    deadlineData: nil)
            ),
            TaskViewModel(inputModel:
                TaskInputModel(
                    writtenData: nil,
                    typedData: nil,
                    tags: [],
                    alertDate: nil,
                    deadlineData: nil)
            ),
            TaskViewModel(inputModel:
                TaskInputModel(
                    writtenData: nil,
                    typedData: nil,
                    tags: [],
                    alertDate: nil,
                    deadlineData: nil)
            )
        ]
    }

    // MARK: - Public functions

    public func newTask() {
        let inputModel = TaskInputModel()
        let viewModel = TaskViewModel(inputModel: inputModel)
        dataSource.append(viewModel)
    }
}
