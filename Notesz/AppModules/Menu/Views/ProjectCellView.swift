//
//  ProjectCellView.swift
//  Notesz
//
//  Created by Varga Benedek on 2020. 05. 10..
//

import SwiftUI

struct ProjectCellView: View {
    @ObservedObject private var viewModel: ProjectCellViewModel

    init(viewModel: ProjectCellViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            HStack {
                Text(viewModel.name)
                    .font(.system(size: 18.0))
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .frame(maxHeight: .infinity)
                    .padding(.leading, 12)
                Spacer()
                Text(viewModel.completed)
                    .font(.system(size: 12.0))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding([.top, .bottom], 6)
                    .padding([.leading, .trailing], 10)
                    .background(Color.green)
                    .cornerRadius(10, antialiased: true)
                Text(viewModel.duration)
                    .font(.system(size: 12.0))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding([.top, .bottom], 6)
                    .padding([.leading, .trailing], 10)
                    .background(Color.noteszDarkBlue)
                    .cornerRadius(10, antialiased: true)
            }
        }
        .padding(0)
        .padding(.trailing, -20)
    }
}
