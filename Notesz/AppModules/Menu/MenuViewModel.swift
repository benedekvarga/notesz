//
//  MenuViewModel.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 19..
//

import Combine
import Foundation

class MenuViewModel: ObservableObject, Identifiable {
    @Published public var data: [Group] = []

    init() {
        self.data = MockDataBase.shared.database
    }
}
