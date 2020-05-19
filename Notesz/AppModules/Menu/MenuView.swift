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
                    Section(header: GroupSectionHeaderView(title: .constant(group.name), duration: .constant(120)).background(Color.clear)
                        .contextMenu {
                            Button(action: {
                            }) {
                                Text("Új projekt")
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                            }

                            Button(action: {
                            }) {
                                Text("Törlés")
                                Image(systemName: "trash")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                            }
                        }
                    ) {
                        ForEach(group.projects, id: \.self) { project in
                            NavigationLink(destination: TaskListView(viewModel: TaskListViewModel(project: project.project))) {
                                ProjectCellView(title: .constant(project.name), numberOfCompletedTasks: .constant(project.completed), duration: .constant(60))
                                .contextMenu {
                                    Button(action: {
                                    }) {
                                        Text("Új feladat")
                                        Image(systemName: "plus.circle")
                                            .resizable()
                                            .frame(width: 14, height: 14)
                                    }

                                    Button(action: {
                                    }) {
                                        Text("Törlés")
                                        Image(systemName: "trash")
                                            .resizable()
                                            .frame(width: 14, height: 14)
                                    }
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
                        print("uj csoport")
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
