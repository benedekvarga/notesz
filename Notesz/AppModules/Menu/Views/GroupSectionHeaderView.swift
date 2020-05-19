//
//  GroupSectionHeaderView.swift
//  Notesz
//
//  Created by Varga Benedek on 2020. 05. 09..
//

import SwiftUI

struct GroupSectionHeaderView: View {
    @Binding var title: String
    @Binding var duration: Int

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.system(size: 22.0))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(maxHeight: .infinity)
                    .padding(.bottom, -10)
                Spacer()
                Text("\(duration) perc")
                    .font(.system(size: 16.0))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(maxHeight: .infinity)
                    .padding(.bottom, -10)
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

struct GroupSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        GroupSectionHeaderView(title: .constant("Munka"), duration: .constant(170))
        .previewLayout(.fixed(width: 300, height: 50))
    }
}
