//
//  GroupTests.swift
//  NoteszTests
//
//

import XCTest
@testable import Notesz

class TCGroupTests: XCTestCase {

    var group: Group!



    override func setUp() {
        let task = Task(typedData: "task", orderId: 0)
        let project = Project(name: "project", orderId: 0, tasks: [task])

        group = Group(name: "group", orderId: 0, projects: [project])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        let task = Task(typedData: "task", orderId: 0)
        let project = Project(name: "project", orderId: 0, tasks: [task])
        group = Group(name: "group", orderId: 0, projects: [project])

        group.projects.removeAll()
    }

    func testDurationCalculationForEmptyTasksAndProjects() {
        let duration = group.duration
        XCTAssertEqual(duration, 0, "Duration calculation for emty tasks and projects arrays is incorrect.")
    }

    func testDurationCalculation() {
        var task1 = Task(typedData: "task1", orderId: 1)
        task1.duration = 1
        var task2 = Task(typedData: "task2", orderId: 2)
        task2.duration = 2
        group.projects[0].tasks.append(task1)
        group.projects[0].tasks.append(task2)

        let duration = group.duration
        XCTAssertEqual(duration, 3, "Duration calculation for empty projects and not empty tasks arrays is incorrect.")
    }
}

