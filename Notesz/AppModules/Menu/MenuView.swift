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
            List(viewModel.data, id: \.self) { data in
                Text(data)
            }
            .navigationBarTitle("Notesz")

            NavigationLink(
              destination: CompareView()) {
                Spacer()
                Text("Compare PKCanvas and SmoothCanvas")
                Spacer()
            }
            .padding([.leading, .trailing], 24)
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
