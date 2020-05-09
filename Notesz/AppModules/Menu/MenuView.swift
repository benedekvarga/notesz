//
//  MenuView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 19..
//

import SwiftUI

struct MenuView: View {
    @ObservedObject private var viewModel = MenuViewModel()
    @State private var showCompare: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            List {
                ForEach(viewModel.data, id: \.self) { group in
                    Section(header: GroupSectionHeaderView(title: .constant(group.name)).background(Color.clear)) {
                        ForEach(group.projects, id: \.self) { project in
                            NavigationLink(destination: TaskListView(viewModel: TaskListViewModel(name: project.name, tasks: project.tasks))) {
                                Text(project.name)
                            }
                        }
                    }
                    .background(Color.clear)
                }
                .background(Color.clear)
            }
            .navigationBarTitle("Notesz")

            NavigationLink(destination: CompareView()) {
                Spacer()
                Text("Compare PKCanvas and SmoothCanvas")
                Spacer()
            }
            .padding([.leading, .trailing], 24)
        }
    }

    init() {
        UITableView.appearance().tableFooterView = UIView(frame: .zero)
    }
}

struct MenuViewPreviews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
