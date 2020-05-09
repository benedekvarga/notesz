//
//  PKCanvasViewRepresentable.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 22..
//

import SwiftUI
import PencilKit

struct PKCanvasViewRepresentable: UIViewRepresentable {
    // MARK: - Properties

    @Binding var shouldClearData: Int
    @Binding var penColor: UIColor
    @State var data: Data?

    // MARK: - UIViewRepresentable functions

    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
        canvasView.layer.masksToBounds = false
        canvasView.allowsFingerDrawing = false
        canvasView.delegate = context.coordinator
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        if shouldClearData > 0 {
            uiView.drawing = PKDrawing()
        }

        uiView.tool = PKInkingTool(.pen, color: penColor, width: 2)
    }

    func makeCoordinator() -> PKCanvasViewRepresentable.Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, PKCanvasViewDelegate {
        private let canvas: PKCanvasViewRepresentable

        init(_ canvas: PKCanvasViewRepresentable) {
            self.canvas = canvas
        }

        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            print("drawing changed")
            canvas.data = canvasView.drawing.dataRepresentation()
        }
    }
}
