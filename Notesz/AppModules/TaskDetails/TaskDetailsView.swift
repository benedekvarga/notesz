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
    @State private var selectedDate = Date()
    @State private var showDatePicker = false

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd."
        return formatter
    }

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack {
                    HStack(alignment: .center) {
                        Text("Projekt:")
                            .font(.system(size: 12.0))
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .padding(.leading)
                        Text("Háztartás")
                            .font(.system(size: 12.0))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.trailing)
                    }
                    .frame(height: 50)
                    .background(viewModel.isCompleted ? Color.green : Color.clear)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(viewModel.isCompleted ? Color.green : Color.black, lineWidth: 1)
                    )
                    Spacer()
                    HStack(alignment: .center) {
                        Text("Időtartam:")
                            .font(.system(size: 12.0))
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .padding(.leading)
                        Text("20 perc")
                            .font(.system(size: 12.0))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.trailing)
                    }
                    .frame(height: 50)
                    .background(viewModel.isCompleted ? Color.green : Color.clear)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(viewModel.isCompleted ? Color.green : Color.black, lineWidth: 1)
                    )
                }
                .padding([.leading, .trailing], 12)
                .padding(.bottom, 8)
                ZStack(alignment: .topTrailing) {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.noteszDarkGray, lineWidth: 1)
                        .background(Color.clear)
                    if viewModel.penToolSelected {
                        PKCanvasViewRepresentable(
                            shouldClearData: $shouldClearCanvas,
                            penColor: $viewModel.lineColor,
                            eraserSelected: $viewModel.eraserSelected,
                            lineWidth: $viewModel.lineWidth
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
                    ZStack {
                        Image(systemName: viewModel.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .font(Font.title.weight(.light))
                            .foregroundColor(viewModel.isCompleted ? Color.white : Color.black)
                    }
                    .frame(width: 50, height: 50)
                    .background(viewModel.isCompleted ? Color.green : Color.clear)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(viewModel.isCompleted ? Color.green : Color.black, lineWidth: 1)
                    )
                    .onTapGesture {
                        self.viewModel.isCompleted.toggle()
                    }

                    HStack(alignment: .center) {
                        Text("Beviteli mód:")
                            .font(.system(size: 12.0))
                            .fontWeight(.light)
                            .foregroundColor(.black)
                        Image(systemName: viewModel.penToolSelected ? "square.and.pencil" : "keyboard")
                            .resizable()
                            .font(Font.title.weight(.light))
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .frame(width: 24, height: 20, alignment: .center)
                    }
                    .frame(height: 34)
                    .padding([.top, .bottom], 8)
                    .padding([.leading, .trailing], 14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1)
                    )
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
                        HStack {
                            Text("2")
                                .font(.system(size: 12.0))
                                .fontWeight(.semibold)
                            Slider(value: $viewModel.lineWidth, in: 2...16, step: 0.1)
                                .accentColor(Color.noteszBlue)
                                .frame(height: 34)
                            Text("16")
                                .font(.system(size: 12.0))
                                .fontWeight(.semibold)
                        }
                    }
                    .padding([.top, .bottom], 8)
                    .padding([.leading, .trailing], 14)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1)
                    )

                    ZStack {
                        Image(systemName: "pencil.slash")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .font(Font.title.weight(.light))
                            .foregroundColor(viewModel.isCompleted ? Color.white : Color.black)
                    }
                    .frame(width: 50, height: 50)
                    .background(viewModel.isCompleted ? Color.green : Color.clear)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(viewModel.isCompleted ? Color.green : Color.black, lineWidth: 1)
                    )
                    .onTapGesture {
                        self.viewModel.isCompleted.toggle()
                    }

                    ZStack {
                        Image(systemName: "delete.right")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .aspectRatio(contentMode: .fit)
                            .font(Font.title.weight(.light))
                            .foregroundColor(Color.red)
                    }
                    .frame(width: 50, height: 50)
                    .background(viewModel.isCompleted ? Color.green : Color.clear)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(viewModel.isCompleted ? Color.green : Color.black, lineWidth: 1)
                    )
                    .onTapGesture {
                        self.viewModel.isCompleted.toggle()
                    }
                }
                .padding([.leading, .trailing], 12)
                .padding(.top, 10)

                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "calendar")
                            Text("Határidő:")
                                .font(.system(size: 12.0))
                                .fontWeight(.light)
                                .foregroundColor(.black)
                            Text("nincs megadva")
                                .font(.system(size: 12.0))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        .frame(height: 34)
                        .padding([.top, .bottom], 8)
                        .padding([.leading, .trailing], 14)
                        .background(Color.clear)
                        .onTapGesture {
                            withAnimation {
                                self.showDatePicker.toggle()
                            }
                        }
                        if showDatePicker {
                            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .labelsHidden()
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    Spacer()
                    HStack(alignment: .center) {
                        Image(systemName: "trash")
                            .resizable()
                            .font(Font.title.weight(.light))
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.red)
                            .frame(width: 24, height: 20, alignment: .center)
                            .padding(.leading, 8)
                        Text("Törlés")
                            .font(.system(size: 12.0))
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                            .padding(.trailing)
                    }
                    .frame(height: 50)
                    .background(viewModel.isCompleted ? Color.green : Color.clear)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.red, lineWidth: 1)
                    )
                }
                .padding([.leading, .trailing], 12)
                .padding(.top, 8)
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
        .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
    }
}
