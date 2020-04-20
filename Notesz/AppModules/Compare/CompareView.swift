//
//  CompareView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 19..
//

import UIKit
import SwiftUI

struct CompareView: View {
    // MARK: - Views

    @State var shouldClearSmoothCanvas = 0
    @State var shouldClearPKCanvas = 0
    @State var selectedPKCanvasColor = UIColor.black
    @State var selectedSmoothCanvasColor = UIColor.black

    var body: some View {
        VStack(alignment: .leading) {
            Text("PKCanvas")
                .font(.title)
                .bold()
                .padding([.leading, .trailing], 24)
                .padding(.bottom, -6)
            ZStack(alignment: .topTrailing) {
                PKCanvasViewRepresentable(shouldClearData: $shouldClearPKCanvas, penColor: $selectedPKCanvasColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.noteszDarkGray, lineWidth: 1)
                )
                HStack {
                    HStack {
                        Text("Pen color:")
                            .padding(.leading, 8)
                            .font(.subheadline)
                        Button(action: {
                            self.selectedPKCanvasColor = .black
                        }, label: {
                            Image(systemName: selectedPKCanvasColor == .some(.black) ? "largecircle.fill.circle" : "circle.fill")
                                .resizable()
                                .foregroundColor(UIColor.black.color)
                                .frame(width: 18, height: 18, alignment: .center)
                        })
                        Button(action: {
                            self.selectedPKCanvasColor = .blue
                        }, label: {
                            Image(systemName: selectedPKCanvasColor == .some(.blue) ? "largecircle.fill.circle" : "circle.fill")
                                .resizable()
                                .foregroundColor(UIColor.blue.color)
                                .frame(width: 18, height: 18, alignment: .center)
                        })
                        Button(action: {
                            self.selectedPKCanvasColor = .red
                        }, label: {
                            Image(systemName: selectedPKCanvasColor == .some(.red) ? "largecircle.fill.circle" : "circle.fill")
                                .resizable()
                                .foregroundColor(UIColor.red.color)
                                .frame(width: 18, height: 18, alignment: .center)
                        })
                    }
                    Spacer()
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
            }
            .padding([.leading, .trailing], 24)
            Text("SmoothCanvas")
                .font(.title)
                .bold()
                .padding(.top)
                .padding([.leading, .trailing], 24)
                .padding(.bottom, -6)
            ZStack(alignment: .topTrailing) {
                SmoothCanvasRepresentable(shouldClearData: $shouldClearSmoothCanvas, penColor: $selectedSmoothCanvasColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.noteszDarkGray, lineWidth: 1)
                )
                HStack {
                    HStack {
                        Text("Pen color:")
                            .padding(.leading, 8)
                            .font(.subheadline)
                        Button(action: {
                            self.selectedSmoothCanvasColor = .black
                        }, label: {
                            Image(systemName: selectedSmoothCanvasColor == .some(.black) ? "largecircle.fill.circle" : "circle.fill")
                                .resizable()
                                .foregroundColor(UIColor.black.color)
                                .frame(width: 18, height: 18, alignment: .center)
                        })
                        Button(action: {
                            self.selectedSmoothCanvasColor = .blue
                        }, label: {
                            Image(systemName: selectedSmoothCanvasColor == .some(.blue) ? "largecircle.fill.circle" : "circle.fill")
                                .resizable()
                                .foregroundColor(UIColor.blue.color)
                                .frame(width: 18, height: 18, alignment: .center)
                        })
                        Button(action: {
                            self.selectedSmoothCanvasColor = .red
                        }, label: {
                            Image(systemName: selectedSmoothCanvasColor == .some(.red) ? "largecircle.fill.circle" : "circle.fill")
                                .resizable()
                                .foregroundColor(UIColor.red.color)
                                .frame(width: 18, height: 18, alignment: .center)
                        })
                    }
                    Spacer()
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
