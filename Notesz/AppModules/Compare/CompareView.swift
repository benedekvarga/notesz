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

    @State var shouldClearPKCanvas = 0
    @State var selectedPKCanvasColor = UIColor.black
    @State var pkLineWidth: CGFloat = 2
    @State var pkEraserSelected = false

    @State var shouldClearSmoothCanvas = 0
    @State var selectedSmoothCanvasColor = UIColor.black
    @State var smoothLineWidth: CGFloat = 2
    @State var smoothEraserSelected = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("PKCanvas")
                .font(.title)
                .bold()
                .padding([.leading, .trailing], 24)
                .padding(.bottom, -6)
            ZStack(alignment: .topTrailing) {
                PKCanvasViewRepresentable(
                        task: .constant(Task(typedData: "", orderId: 20)),
                        project: .constant(Project(name: "", orderId: 20, tasks: [])),
                        group: .constant(Group(name: "", orderId: 20, projects: [])),
                        shouldClearData: $shouldClearPKCanvas,
                        penColor: $selectedPKCanvasColor,
                        eraserSelected: $pkEraserSelected,
                        lineWidth: $pkLineWidth
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.noteszDarkGray, lineWidth: 1)
                )
                VStack {
                    HStack {
                        HStack {
                            Text("Szín:")
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
                            self.pkEraserSelected.toggle()
                        }, label: {
                            Image(systemName: pkEraserSelected ? "pencil.slash" : "pencil")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(.black)
                                .padding(8)
                        })
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
                    Spacer()
                    HStack(alignment: .center) {
                        Text("Vonalvastagság:")
                            .font(.system(size: 12.0))
                            .fontWeight(.light)
                            .foregroundColor(.black)
                        ZStack {
                            Circle()
                                .frame(width: CGFloat(pkLineWidth), height: CGFloat(pkLineWidth))
                        }
                        .frame(width: 20, height: 30)
                        HStack {
                            Text("1")
                                .font(.system(size: 12.0))
                                .fontWeight(.semibold)
                            Slider(value: $pkLineWidth, in: 1...20, step: 0.1)
                                .accentColor(Color.noteszBlue)
                                .frame(height: 34)
                            Text("20")
                                .font(.system(size: 12.0))
                                .fontWeight(.semibold)
                        }
                    }
                    .padding([.leading, .trailing], 24)
                    .padding(.bottom)
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
                SmoothCanvasRepresentable(
                        shouldClearData: $shouldClearSmoothCanvas,
                        penColor: $selectedSmoothCanvasColor,
                        eraserSelected: $smoothEraserSelected,
                        lineWidth: $smoothLineWidth
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.noteszDarkGray, lineWidth: 1)
                )
                VStack {
                    HStack {
                        HStack {
                            Text("Szín:")
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
                            self.smoothEraserSelected.toggle()
                        }, label: {
                            Image(systemName: smoothEraserSelected ? "pencil.slash" : "pencil")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(.black)
                                .padding(8)
                        })
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
                    Spacer()
                    HStack(alignment: .center) {
                        Text("Vonalvastagság:")
                            .font(.system(size: 12.0))
                            .fontWeight(.light)
                            .foregroundColor(.black)
                        ZStack {
                            Circle()
                                .frame(width: CGFloat(smoothLineWidth), height: CGFloat(smoothLineWidth))
                        }
                        .frame(width: 20, height: 30)
                        HStack {
                            Text("1")
                                .font(.system(size: 12.0))
                                .fontWeight(.semibold)
                            Slider(value: $smoothLineWidth, in: 1...20, step: 0.1)
                                .accentColor(Color.noteszBlue)
                                .frame(height: 34)
                            Text("20")
                                .font(.system(size: 12.0))
                                .fontWeight(.semibold)
                        }
                    }
                    .padding([.leading, .trailing], 24)
                    .padding(.bottom)
                }
            }
            .padding([.leading, .trailing, .bottom], 24)
        }
        .navigationBarTitle("PKCanvas és SmoothCanvas összehasonlítása")
    }
}

struct CompareViewPreviews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
