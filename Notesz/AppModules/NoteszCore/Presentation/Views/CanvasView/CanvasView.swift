//
//  CanvasView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 22..
//

import SwiftUI
import UIKit

struct CanvasView: View {
    var body: some View {
        PKCanvasViewRepresentable()
    }
}

struct CanvasViewPreviews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
