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

    // MARK: - RootViewProtocol properties

    var subscriptions = Set<AnyCancellable>()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TaskStatusIndicatorView()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 12)
                ZStack {
                    CanvasView()
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
                VStack(alignment: .leading) {
                    Text(viewModel.description)
                        .font(.subheadline)
                    HStack {
                        Image(systemName: "bell")
                        Text(viewModel.alertText)
                            .font(.subheadline)
                            .font(.caption)
                    }
                    HStack {
                        Image(systemName: "calendar")
                        Text(viewModel.deadlineText)
                            .font(.subheadline)
                    }
                }
                .padding(.leading, 48)
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
                    description: nil,
                    tags: [],
                    alertDate: nil,
                    deadlineData: nil
                )
            )
        )
    }
}
