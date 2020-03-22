//
//  TaskView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 10..
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        HStack(spacing: 8) {
            Spacer(minLength: 8)
            TaskStatusIndicatorView()
                .frame(width: 36, height: 36)
            Text("This is a task.")
                .lineLimit(1)
            Spacer(minLength: 8)
        }
        .background(Color.blue)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
        .previewLayout(.fixed(width: 375, height: 70))
    }
}
