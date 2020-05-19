//
//  TaskCellView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//

import SwiftUI
import Combine

struct TaskCellView: View, RootViewProtocol {
    // MARK: - Properties

    @ObservedObject private var viewModel: TaskCellViewModel

    // MARK: - RootViewProtocol properties

    var subscriptions = Set<AnyCancellable>()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TaskStatusIndicatorView(isSelected: $viewModel.isCompleted)
                    .frame(width: 24, height: 24)
                    .padding(.leading, 12)
                ZStack(alignment: .topTrailing) {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.noteszDarkGray, lineWidth: 1)
                        .background(Color.clear)
                    if viewModel.penToolSelected {
                        PKCanvasViewRepresentable(
                            shouldClearData: .constant(0),
                            penColor: .constant(.black),
                            eraserSelected: .constant(false),
                            lineWidth: .constant(CGFloat(2))
                        )
                        .padding([.top, .bottom], 2)
                        .padding(.leading, 2)
                        .padding(.trailing, 14)
                    } else {
                        VStack(alignment: .center) {
                            Spacer()
                            TextField("Add new task", text: $viewModel.typedData)
                                .background(Color.clear)
                                .font(.system(size: 16.0))
                            Spacer()
                        }
                        .padding()
                    }
                }
                VStack {
                    Image(systemName: "ellipsis.circle")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .padding(.trailing, 8)
                        .padding(.top, 8)
                        .onTapGesture {
                            self.viewModel.showDetails.toggle()
                        }
                        .sheet(isPresented: $viewModel.showDetails) {
                            TaskDetailsView(viewModel: TaskDetailsViewModel(task: self.viewModel.task, project: self.viewModel.project))
                        }
                    Spacer()
                    Image(systemName: viewModel.penToolSelected ? "square.and.pencil" : "keyboard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 20, alignment: .center)
                        .padding(.trailing, 8)
                        .padding(.bottom, 6)
                        .onTapGesture {
                            self.viewModel.penToolSelected.toggle()
                        }
                }
            }
            .frame(height: 70)
            .contextMenu {
                Button(
                    action: {
                        self.viewModel.isCompleted.toggle()
                    },
                    label: {
                        Text(viewModel.isCompleted ? "Nincs kész" : "Kész")
                        Image(systemName: "checkmark.circle")
                    }
                )
                Button(
                    action: {
                        self.viewModel.showDetails.toggle()
                    },
                    label: {
                        Text("Részletek")
                        Image(systemName: "ellipsis.circle")
                    }
                )
                Button(
                    action: {
                        self.viewModel.deleteTask()
                    },
                    label: {
                        Text("Törlés")
                        Image(systemName: "trash")
                    }
                )
            }
        }
        .padding(.bottom, 0)
    }

    // MARK: - Initialization

    init(viewModel: TaskCellViewModel) {
        self.viewModel = viewModel
    }
}

struct TaskViewPreviews: PreviewProvider {
    static var previews: some View {
        TaskCellView(viewModel:
            TaskCellViewModel(task:
                Task(typedData: "Teszt cell", orderId: 0),
                project: "Feladat"
            )
        )
    }
}
