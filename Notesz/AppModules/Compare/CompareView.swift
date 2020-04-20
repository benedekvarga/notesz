//
//  CompareView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 19..
//

import SwiftUI

struct CompareView: View {
    // MARK: - Views

    @State var shouldClearSmoothCanvas = 0
    @State var shouldClearPKCanvas = 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("PKCanvas")
                .font(.subheadline)
                .bold()
                .padding([.leading, .trailing], 24)
                .padding(.bottom, -6)
            ZStack(alignment: .topTrailing) {
                PKCanvasViewRepresentable(shouldClearData: $shouldClearPKCanvas)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.noteszDarkGray, lineWidth: 1)
                )

                Button(action: {
                    self.shouldClearPKCanvas += 1
                }, label: {
                    Image(systemName: "clear")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.red)
                        .padding(8)
                })
            }
            .padding([.leading, .trailing], 24)
            Text("SmoothCanvas")
                .font(.subheadline)
                .bold()
                .padding([.top, .leading, .trailing], 24)
                .padding(.bottom, -6)
            ZStack(alignment: .topTrailing) {
                SmoothCanvasRepresentable(shouldClearData: $shouldClearSmoothCanvas)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.noteszDarkGray, lineWidth: 1)
                )

                Button(action: {
                    self.shouldClearSmoothCanvas += 1
                }, label: {
                    Image(systemName: "clear")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.red)
                        .padding(8)
                })
            }
            .padding([.leading, .trailing, .bottom], 24)
        }
        .navigationBarTitle("Compare PKCanvas and SmoothCanvas")
    }
}

struct CompareViewPreviews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
