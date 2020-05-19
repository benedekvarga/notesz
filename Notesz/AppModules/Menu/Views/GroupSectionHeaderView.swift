//
//  GroupSectionHeaderView.swift
//  Notesz
//
//  Created by Varga Benedek on 2020. 05. 09..
//

import SwiftUI

struct GroupSectionHeaderView: View {
    @ObservedObject private var viewModel: GroupSectionHeaderViewModel

    init(viewModel: GroupSectionHeaderViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            HStack {
                Text(viewModel.name)
                    .font(.system(size: 22.0))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(maxHeight: .infinity)
                    .padding(.bottom, -10)
                Text(viewModel.duration)
                    .font(.system(size: 14.0))
                    .fontWeight(.semibold)
                    .foregroundColor(.noteszBlue)
                    .multilineTextAlignment(.leading)
                    .frame(maxHeight: .infinity)
                    .padding(.bottom, -15)
                Spacer()
            }
        }
        .frame(minHeight: 50)
        .padding(0)
        .background(FillAll(color: Color.white))
    }
}

struct FillAll: View {
    let color: Color

    var body: some View {
        GeometryReader { proxy in
            self.color.frame(width: proxy.size.width * 1.3, height: proxy.size.height).fixedSize()
        }
    }
}
