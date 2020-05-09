//
//  TaskView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//

import SwiftUI
import Combine

struct TaskView: View, RootViewProtocol {
    // MARK: - Properties

    @ObservedObject private var viewModel: TaskViewModel
    @State private var isHighlighted = false
    @State var showDatePicker = false
    @State var notifySelected = true
    @State var selectedDate = Date()
    @State var shouldClearCanvas = 0
    @State var penToolSelected = false

    // MARK: - RootViewProtocol properties

    var subscriptions = Set<AnyCancellable>()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TaskStatusIndicatorView()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 12)
                ZStack(alignment: .topTrailing) {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.noteszDarkGray, lineWidth: 1)
                        .background(Color.clear)
                    if penToolSelected {
                        PKCanvasViewRepresentable(
                            shouldClearData: $shouldClearCanvas,
                            penColor: .constant(.black)
                        )
                        .padding([.top, .bottom], 2)
                        .padding(.leading, 2)
                        .padding(.trailing, 14)
                    } else {
                        VStack(alignment: .center) {
                            Spacer()
                            TextField("Add new task", text: $viewModel.typedData)
                                .background(Color.clear)
                            Spacer()
                        }
                        .padding()
                    }
                }
                Image(systemName: "ellipsis.circle")
                .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .padding(.trailing, 8)
                    .onTapGesture {
                        self.$isHighlighted.wrappedValue.toggle()
                    }
            }
            .frame(height: 70)

            if self.$isHighlighted.wrappedValue {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "bell")
                            Text(viewModel.alertText)
                                .font(.subheadline)
                                .onTapGesture {
                                    if !self.$showDatePicker.wrappedValue {
                                        self.$showDatePicker.wrappedValue.toggle()
                                    }
                                }
                        }
                        HStack {
                            Image(systemName: "calendar")
                            Text(viewModel.deadlineText)
                                .font(.subheadline)
                                .onTapGesture {
                                    if !self.$showDatePicker.wrappedValue {
                                        self.$showDatePicker.wrappedValue.toggle()
                                    }
                                }
                        }
                        if self.showDatePicker {
                            DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: .date) {
                                Text("")
                            }
                        }
                    }
                    Spacer()
                    HStack(alignment: .center) {
                        Image(systemName: penToolSelected ? "keyboard" : "pencil.and.outline")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 20)
                            .padding(4)
                            .foregroundColor(.black)
                            .onTapGesture {
                                self.penToolSelected.toggle()
                            }

                        if isHighlighted {
                            Image(systemName: "clear")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.red)
                                .frame(width: 28, height: 20)
                                .padding(4)
                                .onTapGesture {
                                    self.shouldClearCanvas += 1
                                }
                        }
                    }
                }
                .padding(.leading, 48)
                .padding(.trailing, 12)
            }
        }
        .padding(.bottom, self.$isHighlighted.wrappedValue ? 18 : 0)
    }

    // MARK: - Initialization

    init(viewModel: TaskViewModel) {
        self.viewModel = viewModel
        self.penToolSelected = viewModel.typedData.isEmpty
    }
}

struct TaskViewPreviews: PreviewProvider {
    static var previews: some View {
        TaskView(viewModel:
            TaskViewModel(inputModel:
                TaskInputModel(
                    writtenData: nil,
                    typedData: nil,
                    tags: [],
                    alertDate: nil,
                    deadlineData: nil
                )
            )
        )
    }
}
