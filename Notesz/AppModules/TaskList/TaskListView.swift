//
//  TaskListView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: TaskListViewModel

    init(viewModel: TaskListViewModel) {
        self.viewModel = viewModel
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView(frame: .zero)
    }

    var body: some View {
        List {
            Section {
                ForEach(viewModel.dataSource, content: TaskView.init(viewModel:))
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct TaskListViewPreviews: PreviewProvider {
    static var previews: some View {
        TaskListView(viewModel: TaskListViewModel())
    }
}
