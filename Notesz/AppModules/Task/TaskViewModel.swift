//
//  TaskViewModel.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 24..
//
import Combine
import Foundation

class TaskViewModel: RootViewModel, ObservableObject, Identifiable {
    @Published public var writtenData: Data?
    @Published public var typedData: String?
    @Published public var description: String
    @Published public var tags: [Tag] = []
    @Published public var alertText: String
    @Published public var deadlineText: String

    init(inputModel: TaskInputModelProtocol) {
        self.writtenData = inputModel.writtenData
        self.typedData = inputModel.typedData
        self.description = inputModel.description ?? "Add more info"
        self.alertText = inputModel.alertDate?.formattedDateString(format: "dd. MM. YYYY. - hh:mm") ?? "Notify me"
        self.deadlineText = inputModel.alertDate?.formattedDateString(format: "dd. MM. YYYY. - hh:mm") ?? "Set deadline"

        super.init(inputView: inputModel)
    }
}
