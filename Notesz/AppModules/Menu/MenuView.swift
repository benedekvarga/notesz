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
                                ProjectCellView(title: .constant(project.name), numberOfCompletedTasks: .constant(project.completed))
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Notesz")

            NavigationLink(destination: CompareView()) {
                ZStack {
                    Rectangle()
                        .background(Color.noteszBlue)
                        .padding([.leading, .trailing, .bottom], -50)
                        .frame(height: 60)
                    HStack {
                        Spacer()
                        Text("PKCanvas és SmoothCanvas összehasonlítása")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.top, 16)
                        Spacer()
                    }
                }
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
