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
            Text("Válassz egy projektet!")
                .font(.system(size: 42.0))
                .fontWeight(.ultraLight)
        }
    }
}

struct MainViewPreviews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
