//
//  MenuViewModel.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 19..
//

import Combine
import Foundation

class ProjectViewModel: ObservableObject, Identifiable, Hashable, Equatable {
    @Published public var name: String
    @Published public var completed: String
    @Published public var tasks: [Task]

    init(name: String, completed: String) {
        self.name = name
        self.completed = completed

        self.tasks = MockDataBase.shared.database.flatMap { $0.projects }.filter { $0.name == name }.flatMap { $0.tasks }
    }

    static func == (lhs: ProjectViewModel, rhs: ProjectViewModel) -> Bool {
        return lhs.name == rhs.name && lhs.completed == rhs.completed
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

class GroupViewModel: ObservableObject, Identifiable, Hashable, Equatable {
    @Published public var name: String
    @Published public var projects: [ProjectViewModel]

    init(name: String, projects: [ProjectViewModel]) {
        self.name = name
        self.projects = projects
    }

    static func == (lhs: GroupViewModel, rhs: GroupViewModel) -> Bool {
        return lhs.name == rhs.name && lhs.projects == rhs.projects
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

class MenuViewModel: ObservableObject, Identifiable {
    @Published public var data: [GroupViewModel] = []

    init() {
        self.data = MockDataBase.shared.database.map { group in
            return GroupViewModel(name: group.name, projects: group.projects.map { project in
                ProjectViewModel(name: project.name, completed: "\(project.tasks.filter { $0.completed }.count)/\(project.tasks.count)")
            })
        }
    }
}
