//
//  ProjectCellViewModel.swift
//  Notesz
//
//  Created by Varga Benedek on 2020. 05. 19..
//

import Combine
import Foundation

class ProjectCellViewModel: ObservableObject, Identifiable, Hashable, Equatable {
    // MARK: - Properties

    private var subscriptions = Set<AnyCancellable>()

    @Published public var name: String = ""
    @Published public var duration: String = ""
    @Published public var completed: String = ""
    @Published private var project: Project

    init(project: Project) {
        self.project = project

        binds()
    }

    static func == (lhs: ProjectCellViewModel, rhs: ProjectCellViewModel) -> Bool {
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
                let numberOfCompletedTasks = project.tasks.filter { $0.completed }.count
                self.completed = "\(numberOfCompletedTasks)/\(project.tasks.count)"
                self.duration = "\(project.duration) perc"
            })
            .store(in: &subscriptions)

        DataBase.shared.$shouldUpdateView
        .sink(receiveValue: { _ in
            print("should update project cell")
            self.duration = "\(self.project.duration) perc"
            let numberOfCompletedTasks = self.project.tasks.filter { $0.completed }.count
            self.completed = "\(numberOfCompletedTasks)/\(self.project.tasks.count)"
        })
        .store(in: &subscriptions)
    }
}
