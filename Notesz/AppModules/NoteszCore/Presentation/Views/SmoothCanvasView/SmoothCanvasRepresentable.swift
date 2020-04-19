//
//  SmoothCanvasRepresentable.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 19..
//

import SwiftUI
import SmoothCanvasSPM

struct SmoothCanvasRepresentable: UIViewRepresentable {
    // MARK: - UIViewRepresentable functions

    func makeUIView(context: Context) -> SmoothCanvasView {
        let canvasView = SmoothCanvasView()
        canvasView.layer.masksToBounds = false
        canvasView.isWritingByTouchEnabled = false
        return canvasView
    }

    func updateUIView(_ uiView: SmoothCanvasView, context: Context) {
    }
}

struct SmoothCanvasRepresentablePreviews: PreviewProvider {
    static var previews: some View {
        SmoothCanvasRepresentable()
    }
}
