//
//  GroupSectionHeaderViewModel.swift
//  Notesz
//
//  Created by Varga Benedek on 2020. 05. 19..
//

import Combine
import Foundation

class GroupSectionHeaderViewModel: ObservableObject, Identifiable, Hashable, Equatable {
    // MARK: - Properties

    private var subscriptions = Set<AnyCancellable>()

    @Published public var name: String = ""
    @Published public var duration: String = ""
    @Published private var group: Group

    init(group: Group) {
        self.group = group
        binds()
    }

    static func == (lhs: GroupSectionHeaderViewModel, rhs: GroupSectionHeaderViewModel) -> Bool {
        return lhs.group == rhs.group
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    // MARK: - Functions

    private func binds() {
        $group
            .sink(receiveValue: { [weak self] group in
                guard let self = self else { return }

                self.name = group.name
                self.duration = "\(group.duration) perc"
            })
            .store(in: &subscriptions)
    }
}
