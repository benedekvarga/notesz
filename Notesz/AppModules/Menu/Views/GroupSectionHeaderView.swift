//
//  GroupSectionHeaderView.swift
//  Notesz
//
//  Created by Varga Benedek on 2020. 05. 09..
//

import SwiftUI

struct GroupSectionHeaderView: View {
    @Binding var title: String

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxHeight: .infinity)
                Spacer()
            }
        }
        .frame(minHeight: 40)
        .padding(0)
        .background(FillAll(color: Color.noteszBlue))
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

struct GroupSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        GroupSectionHeaderView(title: .constant("Munka"))
        .previewLayout(.fixed(width: 300, height: 40))
    }
}
