//
//  MockDataBase.swift
//  Notesz
//
//  Created by Varga Benedek on 2020. 05. 09..
//

import Foundation

class MockDataBase {
    public static let shared = MockDataBase()

    let database: [Group]

    private init() {
        self.database = [
            Group(
                name: "Személyes",
                orderId: 0,
                projects: [
                    Project(
                        name: "Háztartás",
                        orderId: 0,
                        tasks: [
                            Task(typedData: "Porszívózz ki", orderId: 0),
                            Task(typedData: "Vidd le a szemetet", orderId: 1),
                            Task(typedData: "Vásárolj be", orderId: 2)
                        ]
                    ),
                    Project(
                        name: "Bevásárlás",
                        orderId: 1,
                        tasks: [
                            Task(typedData: "Sonka", orderId: 0),
                            Task(typedData: "Paradicsomszósz", orderId: 1),
                            Task(typedData: "Pizzaliszt", orderId: 2),
                            Task(typedData: "Mozzarella", orderId: 3),
                            Task(typedData: "Bazsalikom", orderId: 4)
                        ]
                    )
                ]
            ),
            Group(name: "Munka",
                orderId: 1,
                projects: [
                    Project(
                        name: "Notesz",
                        orderId: 0,
                        tasks: [
                            Task(typedData: "Drag and drop reorder", orderId: 0),
                            Task(typedData: "Kurzortámogatás", orderId: 1),
                            Task(typedData: "TaskCellView UI liftup", orderId: 2),
                            Task(typedData: "Task törlés", orderId: 3),
                            Task(typedData: "Project törlés", orderId: 4),
                            Task(typedData: "Group törlés", orderId: 5),
                            Task(typedData: "Context menü", orderId: 6)
                        ]
                    )
                ]
            )
        ]
    }
}
