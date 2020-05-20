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

    @Binding var task: Task
    @Binding var project: Project
    @Binding var group: Group
    @Binding var shouldClearData: Int
    @Binding var penColor: UIColor
    @Binding var eraserSelected: Bool
    @Binding var lineWidth: CGFloat

    var shouldSaveData = 0

    // MARK: - UIViewRepresentable functions

    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
        canvasView.layer.masksToBounds = false
        canvasView.allowsFingerDrawing = false
        canvasView.delegate = context.coordinator
        if let data = self.task.writtenData {
            do {
                canvasView.drawing = try PKDrawing(data: data)
            } catch {
                print("cannot load drawing")
            }
        } else {
            print("writtendata is nil")
        }
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        if shouldClearData > 0 {
            uiView.drawing = PKDrawing()
        } else {
            if let data = self.task.writtenData, uiView.drawing.dataRepresentation() != task.writtenData {
                do {
                    uiView.drawing = try PKDrawing(data: data)
                } catch {
                    print("cannot load drawing")
                }
            }
        }

        if eraserSelected {
            uiView.tool = PKEraserTool(.vector)
        } else {
            uiView.tool = PKInkingTool(.pen, color: penColor, width: lineWidth)
        }
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
            DispatchQueue.main.async {
                self.canvas.task.writtenData = canvasView.drawing.dataRepresentation()
                DataBase.shared.update(task: self.canvas.task, projectId: self.canvas.project.orderId, groupId: self.canvas.group.orderId)
                self.canvas.shouldClearData = 0
            }
        }
    }
}
