//
//  SmoothCanvasRepresentable.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 19..
//

import SwiftUI
import SmoothCanvasSPM

struct SmoothCanvasRepresentable: UIViewRepresentable {
    // MARK: - Properties

    @Binding var shouldClearData: Int
    @Binding var penColor: UIColor
    @Binding var eraserSelected: Bool
    @Binding var lineWidth: CGFloat

    // MARK: - UIViewRepresentable functions

    func makeUIView(context: Context) -> SmoothCanvasView {
        let canvasView = SmoothCanvasView()
        canvasView.layer.masksToBounds = false
        canvasView.isWritingByTouchEnabled = false

        return canvasView
    }

    func updateUIView(_ uiView: SmoothCanvasView, context: Context) {
        if shouldClearData > 0 {
            uiView.clearCanvas()
            DispatchQueue.main.async {
                self.shouldClearData = 0
            }
        }

        uiView.lineColor = penColor
        uiView.lineWidth = lineWidth * 1.4
        uiView.isEraser = eraserSelected
    }
}
