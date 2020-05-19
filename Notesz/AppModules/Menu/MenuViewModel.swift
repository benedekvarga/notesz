//
//  MenuViewModel.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 19..
//

import Combine
import Foundation

// MARK: - ProjectViewModel

class ProjectViewModel: ObservableObject, Identifiable, Hashable, Equatable {
    // MARK: - Properties

    private var subscriptions = Set<AnyCancellable>()

    @Published public var project: Project
    @Published public var name: String = ""
    @Published public var completed: String = ""
    @Published public var duration: Int = 0

    init(project: Project) {
        self.project = project
        binds()
    }

    static func == (lhs: ProjectViewModel, rhs: ProjectViewModel) -> Bool {
        return lhs.project == rhs.project
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    // MARK: - Functions

    private func binds() {
        $project
        .sink(receiveValue: { [weak self] project in
            guard let self = self else { return }

            self.name = project.name
            self.duration = project.duration
            let numberOfCompletedTasks = project.tasks.filter { $0.completed }.count
            self.completed = "\(numberOfCompletedTasks)/\(project.tasks.count)"
        })
        .store(in: &subscriptions)
    }
}

// MARK: - GroupViewModel

class GroupViewModel: ObservableObject, Identifiable, Hashable, Equatable {
    // MARK: - Properties

    private var subscriptions = Set<AnyCancellable>()

    @Published public var name: String = ""
    @Published public var duration: Int = 0
    @Published public var projects: [ProjectViewModel] = []
    @Published public var group: Group

    init(group: Group) {
        self.group = group
        binds()
    }

    static func == (lhs: GroupViewModel, rhs: GroupViewModel) -> Bool {
        return lhs.name == rhs.name && lhs.projects == rhs.projects
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    // MARK: - Functions

    private func binds() {
        $group
        .sink(receiveValue: { [weak self] group in
            guard let self = self else { return }

            self.name = group.name
            self.duration = group.duration
            self.projects = group.projects.map { ProjectViewModel(project: $0) }
        })
        .store(in: &subscriptions)
    }
}

// MARK: - MenuViewModel

class MenuViewModel: ObservableObject, Identifiable {
    @Published public var data: [GroupViewModel] = []

    init() {
        self.data = MockDataBase.shared.database.map { group in
            return GroupViewModel(group: group)
        }
    }

    func newProject(in group: Group) {
        print("Uj projekt \(group.name) csoporthoz")
    }

    func delete(group: Group) {
        print("Delete \(group.name)")
    }

    func newTask(in project: Project) {
        print("Uj feladat \(project.name) projekthez")
    }

    func delete(project: Project) {
        print("Delete", project.name)
    }
}
