//
//  TaskListViewModel.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//

import Combine

class TaskListViewModel: ObservableObject, Identifiable {
    // MARK: - Properties

    @Published private var project: Project
    private var subscriptions = Set<AnyCancellable>()

    @Published var dataSource: [TaskCellViewModel] = []
    @Published var name: String = ""

    // MARK: - Initialization

    init(project: Project) {
        self.project = project

        binds()
    }

    // MARK: - Functions

    public func newTask() {
        let task = Task(typedData: "", orderId: dataSource.count)
        project.tasks.append(task)
    }

    private func binds() {
        $project
        .sink(receiveValue: { [weak self] project in
            guard let self = self else { return }

            self.dataSource = project.tasks.map { TaskCellViewModel(task: $0) }
            self.name = project.name
        })
        .store(in: &subscriptions)
    }
}
