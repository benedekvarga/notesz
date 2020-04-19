//
//  CompareView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 19..
//

import SwiftUI

struct CompareView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("PKCanvas")
                .font(.title)
                .bold()
                .padding([.leading, .trailing, .top], 24)
                .padding(.bottom, -20)
            CanvasView()
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.noteszDarkGray, lineWidth: 1)
                )
                .padding([.leading, .trailing], 24)
            Text("SmoothCanvas")
                .font(.title)
                .bold()
                .padding([.leading, .trailing], 24)
                .padding(.bottom, -20)
            SmoothCanvasRepresentable()
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.noteszDarkGray, lineWidth: 1)
                )
                .padding([.leading, .trailing, .bottom], 24)
        }
    }
}

struct CompareViewPreviews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
