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
        UITableViewCell.appearance().selectionStyle = .none
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {
                Section {
                    ForEach(viewModel.dataSource, content: TaskCellView.init(viewModel:))
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .padding(.bottom, 20)
            }
            .navigationBarTitle(viewModel.name)

            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundColor(Color.blue)
                .padding(12)
                .padding(.trailing, 24)
                .onTapGesture {
                    self.viewModel.newTask()
                }
        }
    }
}
