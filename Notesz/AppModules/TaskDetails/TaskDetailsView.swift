//
//  TaskDetails.swift
//  Notesz
//
//  Created by Varga Benedek on 2020. 05. 10..
//

import SwiftUI

struct TaskDetailsView: View {
    @ObservedObject private var viewModel: TaskDetailsViewModel
    @State var shouldClearCanvas = 0

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.noteszDarkGray, lineWidth: 1)
                        .background(Color.clear)
                    if viewModel.penToolSelected {
                        PKCanvasViewRepresentable(
                            shouldClearData: $shouldClearCanvas,
                            penColor: .constant(.black)
                        )
                            .padding([.top, .bottom], 2)
                            .padding(.leading, 2)
                            .padding(.trailing, 14)
                    } else {
                        VStack(alignment: .center) {
                            Spacer()
                            TextField("Add new task", text: $viewModel.typedData)
                                .background(Color.clear)
                                .font(.system(size: 16.0))
                            Spacer()
                        }
                        .padding()
                    }
                }
                .frame(height: 70)
                .padding([.leading, .trailing], 12)

                HStack {
                    HStack(alignment: .center) {
                        Text("Beviteli mód:")
                            .font(.system(size: 12.0))
                            .fontWeight(.light)
                            .foregroundColor(.white)
                        Image(systemName: viewModel.penToolSelected ? "square.and.pencil" : "keyboard")
                            .resizable()
                            .font(Font.title.weight(.bold))
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 20, alignment: .center)
                    }
                    .frame(height: 34)
                    .padding([.top, .bottom], 8)
                    .padding([.leading, .trailing], 14)
                    .background(Color.noteszBlue)
                    .cornerRadius(6)
                    .onTapGesture {
                        self.viewModel.penToolSelected.toggle()
                    }

                    HStack(alignment: .center) {
                        Text("Szín:")
                            .font(.system(size: 12.0))
                            .fontWeight(.light)
                            .foregroundColor(.black)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .font(Font.title.weight(.bold))
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .frame(width: 18, height: 18, alignment: .center)
                            .onTapGesture {
                                print("black")
                            }
                        Image(systemName: "circle.fill")
                            .resizable()
                            .font(Font.title.weight(.bold))
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.blue)
                            .frame(width: 18, height: 18, alignment: .center)
                            .onTapGesture {
                                print("blue")
                            }
                        Image(systemName: "circle.fill")
                            .resizable()
                            .font(Font.title.weight(.bold))
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.green)
                            .frame(width: 18, height: 18, alignment: .center)
                            .onTapGesture {
                                print("green")
                            }
                        Image(systemName: "circle.fill")
                            .resizable()
                            .font(Font.title.weight(.bold))
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.red)
                            .frame(width: 18, height: 18, alignment: .center)
                            .onTapGesture {
                                print("red")
                            }
                    }
                    .frame(height: 34)
                    .padding([.top, .bottom], 8)
                    .padding([.leading, .trailing], 14)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1)
                    )

                    HStack(alignment: .center) {
                        Text("Vonalvastagság:")
                            .font(.system(size: 12.0))
                            .fontWeight(.light)
                            .foregroundColor(.black)
                        ZStack {
                            Circle()
                                .frame(width: CGFloat(viewModel.lineWidth), height: CGFloat(viewModel.lineWidth))
                        }
                        .frame(width: 20, height: 30)
                        Slider(value: $viewModel.lineWidth, in: 2...16, step: 0.1)
                            .accentColor(Color.noteszBlue)
                            .frame(height: 34)
                    }
                    .padding([.top, .bottom], 8)
                    .padding([.leading, .trailing], 14)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }
                .padding([.leading, .trailing], 12)
                .padding(.top, 10)
            }
        }
        .padding(.bottom, 0)
    }

    // MARK: - Initialization

    init(viewModel: TaskDetailsViewModel) {
        self.viewModel = viewModel
    }
}

struct TaskDetails_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsView(viewModel:
            TaskDetailsViewModel(task:
                Task(typedData: "Teszt cell", orderId: 0)
            )
        )
    }
}
