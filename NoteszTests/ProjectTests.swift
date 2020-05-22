//
//  ProjectTests.swift
//  NoteszTests
//
//

import XCTest
@testable import Notesz

class ProjectTests: XCTestCase {

    var project: Project!
    let task = Task(typedData: "task", orderId: 0)

    override func setUp() {
        project = Project(name: "project", orderId: 0, tasks: [task])
    }

    override func tearDown() {
        project = Project(name: "project", orderId: 0, tasks: [task])
    }

    func testDurationCalculationForEmptyTasks() {
        let duration = project.duration
        XCTAssertEqual(duration, 0, "Duration calculation for empty task array is incorrect")
    }

    func testDurationCalculationForOneTask() {
        var task1 = Task(typedData: "task", orderId: 0)
        task1.duration = 1
        project.tasks = [task1]

        let duration = project.duration
        XCTAssertEqual(duration, 1, "Duration calculation for 1 task is incorrect")
    }

    func testDurationCalculationForThreeTasks() {
        var task1 = Task(typedData: "task1", orderId: 1)
        task1.duration = 1
        var task2 = Task(typedData: "task2", orderId: 2)
        task2.duration = 2
        var task3 = Task(typedData: "task3", orderId: 3)
        task3.duration = 3
        project.tasks = [task1, task2, task3]

        let duration = project.duration
        XCTAssertEqual(duration, 6, "Duration calculation for 3 tasks is incorrect")
    }

    func testDurationCalculationForThreeTasksWithAppend() {
        var task1 = Task(typedData: "task1", orderId: 1)
        task1.duration = 1
        var task2 = Task(typedData: "task2", orderId: 2)
        task2.duration = 2
        var task3 = Task(typedData: "task3", orderId: 3)
        task3.duration = 3
        project.tasks = []
        project.tasks.append(task1)
        project.tasks.append(task2)
        project.tasks.append(task3)

        let duration = project.duration
        XCTAssertEqual(duration, 6, "Duration calculation for 3 tasks is incorrect")
    }

    func testDurationCalculationForTaskWithNilDuration() {
        var task1 = Task(typedData: "task1", orderId: 1)
        task1.duration = 5
        var task2 = Task(typedData: "task2", orderId: 2)
        task2.duration = 1
        let task3 = Task(typedData: "task3", orderId: 3)
        var task4 = Task(typedData: "task4", orderId: 4)
        task4.duration = 4
        project.tasks = [task1, task2, task3, task4]

        let duration = project.duration
        XCTAssertEqual(duration, 10, "Duration calculation for task with nil duration is incorrect")
    }

    func testDurationCalculationForTasksWithNilDuration() {
        let task1 = Task(typedData: "task1", orderId: 1)
        let task2 = Task(typedData: "task2", orderId: 2)
        let task3 = Task(typedData: "task3", orderId: 3)
        let task4 = Task(typedData: "task4", orderId: 4)
        project.tasks = [task1, task2, task3, task4]

        let duration = project.duration
        XCTAssertEqual(duration, 0, "Duration calculation for tasks with nil duration is incorrect")
    }
}
