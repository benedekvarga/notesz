//
//  TaskStatusIndicatorView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 10..
//

import SwiftUI

struct TaskStatusIndicatorView: View {
    var body: some View {
        Circle()
            .foregroundColor(.red)
    }
}

struct TaskStatusIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        TaskStatusIndicatorView()
        .previewLayout(.fixed(width: 50, height: 50))
    }
}
