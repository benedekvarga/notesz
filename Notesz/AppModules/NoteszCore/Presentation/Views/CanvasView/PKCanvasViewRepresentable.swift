//
//  PKCanvasViewRepresentable.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 22..
//

import SwiftUI
import PencilKit

struct PKCanvasViewRepresentable: UIViewRepresentable {
    // MARK: - UIViewRepresentable functions

    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
        canvasView.layer.masksToBounds = false
        canvasView.allowsFingerDrawing = false
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        infoLog("Canvas updated.")
    }
}
