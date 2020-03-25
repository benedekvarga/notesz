//
//  TaskViewModel.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//
import Combine

class TaskViewModel: ObservableObject, Identifiable {
    // MARK: - Properties

    @Published var task: String
    private var disposables = Set<AnyCancellable>()

    // MARK: - Initialization

    init(task: Task) {
        self.task = task.description
    }

    init() {
        self.task = "It's a dummy task."
    }
}
