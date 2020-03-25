//
//  TaskView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//

import SwiftUI

struct TaskView: View {
    // MARK: - Properties

    private let viewModel: TaskViewModel

    var body: some View {
        VStack(alignment: .leading) {
            CanvasView()
        }
    }

    // MARK: - Initialization

    init(viewModel: TaskViewModel) {
        self.viewModel = viewModel
    }
}

struct TaskViewPreviews: PreviewProvider {
    static var previews: some View {
        TaskView(viewModel: TaskViewModel())
    }
}
