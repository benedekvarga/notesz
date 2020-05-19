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
                    Section(header: GroupSectionHeaderView(viewModel: GroupSectionHeaderViewModel(group: group.group)).background(Color.clear)
                        .contextMenu {
                            Button(
                                action: {
                                    self.viewModel.newProject(in: group.group)
                                },
                                label: {
                                    Text("Új projekt")
                                    Image(systemName: "plus.circle")
                                }
                            )
                            Button(
                                action: {
                                    self.viewModel.delete(group: group.group)
                                },
                                label: {
                                    Text("Törlés")
                                    Image(systemName: "trash")
                                }
                            )
                        }
                    ) {
                        ForEach(group.projects, id: \.self) { project in
                            NavigationLink(destination: TaskListView(viewModel: TaskListViewModel(project: project.project))) {
                                ProjectCellView(viewModel: ProjectCellViewModel(project: project.project))
                                .contextMenu {
                                    Button(
                                        action: {
                                            self.viewModel.newTask(in: project.project)
                                        },
                                        label: {
                                            Text("Új feladat")
                                            Image(systemName: "plus.circle")
                                        }
                                    )
                                    Button(
                                        action: {
                                            self.viewModel.delete(project: project.project)
                                        },
                                        label: {
                                            Text("Törlés")
                                            Image(systemName: "trash")
                                        }
                                    )
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Notesz")

            VStack(alignment: .leading) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color.black)
                    .padding(12)
                    .padding(.trailing, 24)
                    .onTapGesture {

                    }
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
