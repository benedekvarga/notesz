//
//  TaskListView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: TaskListViewModel

    var body: some View {
        Section {
            ForEach(viewModel.dataSource, content: TaskView.init(viewModel:))
        }
    }
}
