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
    @Published public var project: Project
    @Published public var group: Group
    @Published public var writtenData: Data?
    @Published public var typedData: String = ""
    @Published public var isCompleted = false
    @Published public var penToolSelected: Bool
    @Published public var showDetails = false

    init(task: Task, project: Project, group: Group) {
        self.task = task
        self.project = project
        self.group = group
        self.writtenData = task.writtenData
        self.typedData = task.typedData ?? ""
        self.isCompleted = task.completed

        self.penToolSelected = task.writtenData != nil
        self.project = project

        binds()
    }

    // MARK: - Functions

    func deleteTask() {
        print("delete task")
    }

    private func binds() {
        $writtenData
        .sink(receiveValue: { [weak self] data in
            guard let self = self else { return }

            self.task.writtenData = data
            self.update(task: self.task)
        })
        .store(in: &subscriptions)

        $typedData
        .sink(receiveValue: { [weak self] data in
            guard let self = self else { return }

            self.task.typedData = data
            self.update(task: self.task)
        })
        .store(in: &subscriptions)

        $isCompleted
        .sink(receiveValue: { [weak self] data in
            guard let self = self else { return }

            self.task.completed = data
            self.update(task: self.task)
        })
        .store(in: &subscriptions)

        $showDetails
        .sink(receiveValue: { _ in
            self.fetchTask()
            self.updateView()
        })
        .store(in: &subscriptions)
    }

    func updateView() {
        self.writtenData = task.writtenData
        self.typedData = task.typedData ?? ""
        self.isCompleted = task.completed
    }

    func update(task: Task) {
        DataBase.shared.update(task: task, projectId: self.project.orderId, groupId: self.group.orderId)
    }

    func fetchTask() {
        let newTask = DataBase.shared.database[group.orderId].projects[project.orderId].tasks[task.orderId]

        self.writtenData = newTask.writtenData
        self.typedData = newTask.typedData ?? ""
        self.isCompleted = newTask.completed
    }
}
