//
//  TaskStatusIndicatorView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 10..
//

import SwiftUI

struct TaskStatusIndicatorView: View {
    // MARK: - Properties

    @State private var isSelected = false

    var body: some View {
        ZStack {
            Rectangle()
            .foregroundColor(.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.noteszLightGray, lineWidth: 2)
            )

            if $isSelected.wrappedValue {
                Image(uiImage: #imageLiteral(resourceName: "Image").withRenderingMode(.alwaysTemplate))
                .foregroundColor(.green)
                .transition(.opacity)
            }
        }
        .onTapGesture {
            withAnimation {
                self.$isSelected.wrappedValue.toggle()
            }
        }
    }
}

struct TaskStatusIndicatorViewPreviews: PreviewProvider {
    static var previews: some View {
        TaskStatusIndicatorView()
        .previewLayout(.fixed(width: 24, height: 24))
    }
}
