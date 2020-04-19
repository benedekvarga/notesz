//
//  MainView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 19..
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            MenuView()
            TaskListView(viewModel: TaskListViewModel())
        }
    }
}

struct MainViewPreviews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
