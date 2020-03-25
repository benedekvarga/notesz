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
            TaskViewModel(),
            TaskViewModel(),
            TaskViewModel()
        ]
    }
}
