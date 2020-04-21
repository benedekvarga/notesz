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

    // MARK: - RootViewProtocol properties

    var subscriptions = Set<AnyCancellable>()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TaskStatusIndicatorView()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 12)
                ZStack {
                    PKCanvasViewRepresentable(shouldClearData: $shouldClearCanvas, penColor: .constant(.black))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.noteszDarkGray, lineWidth: 1)
                        )
                        .padding([.top, .bottom], 8)
                        .padding(.trailing, 12)
                }
            }
            .onTapGesture {
                self.$isHighlighted.wrappedValue.toggle()
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
                    Button(action: {
                        self.shouldClearCanvas += 1
                    }, label: {
                        Image(systemName: "clear")
                    })
                    .foregroundColor(.red)
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
