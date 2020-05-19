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
                            Task(typedData: "Porszívózz ki", completed: true, orderId: 0, duration: 20),
                            Task(typedData: "Vidd le a szemetet", orderId: 1, duration: 5),
                            Task(typedData: "Vásárolj be", completed: true, orderId: 2, duration: 90)
                        ]
                    ),
                    Project(
                        name: "Bevásárlás",
                        orderId: 1,
                        tasks: [
                            Task(typedData: "Sonka", completed: true, orderId: 0),
                            Task(typedData: "Paradicsomszósz", orderId: 1),
                            Task(typedData: "Pizzaliszt", orderId: 2),
                            Task(typedData: "Mozzarella", completed: true, orderId: 3),
                            Task(typedData: "Bazsalikom", orderId: 4)
                        ]
                    )
                ]
            ),
            Group(name: "Fejlesztés",
                orderId: 1,
                projects: [
                    Project(
                        name: "Notesz app",
                        orderId: 0,
                        tasks: [
                            Task(typedData: "Kurzortámogatás", completed: true, orderId: 0, duration: 150),
                            Task(typedData: "TaskCellView UI liftup", orderId: 1),
                            Task(typedData: "Task törlés", orderId: 2),
                            Task(typedData: "Project törlés", orderId: 3),
                            Task(typedData: "Group törlés", orderId: 4),
                            Task(typedData: "Context menü", completed: true, orderId: 5)
                        ]
                    ),
                    Project(
                        name: "Dashboard app",
                        orderId: 1,
                        tasks: [
                            Task(typedData: "Brainstorming", orderId: 0, duration: 300)
                        ]
                    )
                ]
            )
        ]
    }
}
