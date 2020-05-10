//
//  TaskStatusIndicatorView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 10..
//

import SwiftUI

struct TaskStatusIndicatorView: View {
    // MARK: - Properties

    @Binding var isSelected: Bool

    var body: some View {
        ZStack {
            Rectangle()
            .foregroundColor(.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(self.isSelected ? Color.green : Color.black, lineWidth: 2)
            )

            if $isSelected.wrappedValue {
                Image(uiImage: #imageLiteral(resourceName: "Image").withRenderingMode(.alwaysTemplate))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 18, height: 18)
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
        TaskStatusIndicatorView(isSelected: .constant(true))
        .previewLayout(.fixed(width: 24, height: 24))
    }
}
