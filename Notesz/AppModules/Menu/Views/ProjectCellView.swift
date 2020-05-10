//
//  ProjectCellView.swift
//  Notesz
//
//  Created by Varga Benedek on 2020. 05. 10..
//

import SwiftUI

struct ProjectCellView: View {
    @Binding var title: String
    @Binding var numberOfCompletedTasks: String

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.system(size: 18.0))
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .frame(maxHeight: .infinity)
                    .padding(.leading, 12)

                Text(numberOfCompletedTasks)
                    .font(.system(size: 12.0))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding([.top, .bottom], 6)
                    .padding([.leading, .trailing], 10)
                    .background(Color.noteszDarkBlue)
                    .cornerRadius(10, antialiased: true)
                Spacer()
            }
        }
        .padding(0)
    }
}

struct ProjectCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCellView(title: .constant("Shopping"), numberOfCompletedTasks: .constant("2/5"))
        .previewLayout(.fixed(width: 300, height: 40))
    }
}
