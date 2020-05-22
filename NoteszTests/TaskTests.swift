//
//  TaskTests.swift
//  NoteszTests
//
//

import XCTest
@testable import Notesz

class TaskTests: XCTestCase {
    var task: Task!

    override func setUp() {
        task = Task(typedData: "task", orderId: 0)
    }

    func testRemaining20Seconds() {
        task.deadline = Date().addingTimeInterval(20.0)
        let remaining = task.remainingTime
        let remainingString = "\(remaining?.0 ?? 0) \(remaining?.1.rawValue ?? "")"

        XCTAssertEqual(remainingString, "20 sec", "Remaining time calculation for task is incorrect")
    }

    func testRemainingMinutes() {
        task.deadline = Date().addingTimeInterval(331.0)
        let remaining = task.remainingTime
        let remainingString = "\(remaining?.0 ?? 0) \(remaining?.1.rawValue ?? "")"

        XCTAssertEqual(remainingString, "6 minute", "Remaining time calculation for task is incorrect")
    }

    func testRemaining59Minutes() {
        task.deadline = Date().addingTimeInterval(3544.0)
        let remaining = task.remainingTime
        let remainingString = "\(remaining?.0 ?? 0) \(remaining?.1.rawValue ?? "")"

        XCTAssertEqual(remainingString, "59 minute", "Remaining time calculation for task is incorrect")
    }

    func testRemaining2Hours() {
        task.deadline = Date().addingTimeInterval(5432.0)
        let remaining = task.remainingTime
        let remainingString = "\(remaining?.0 ?? 0) \(remaining?.1.rawValue ?? "")"

        XCTAssertEqual(remainingString, "2 hour", "Remaining time calculation for task is incorrect")
    }

    func testRemaining24Hours() {
        task.deadline = Date().addingTimeInterval(86000.0)
        let remaining = task.remainingTime
        let remainingString = "\(remaining?.0 ?? 0) \(remaining?.1.rawValue ?? "")"

        XCTAssertEqual(remainingString, "24 hour", "Remaining time calculation for task is incorrect")
    }

    func testRemaining5Days() {
        task.deadline = Date().addingTimeInterval(430000.0)
        let remaining = task.remainingTime
        let remainingString = "\(remaining?.0 ?? 0) \(remaining?.1.rawValue ?? "")"

        XCTAssertEqual(remainingString, "5 day", "Remaining time calculation for task is incorrect")
    }

    func testRemaining3Weeks() {
        task.deadline = Date().addingTimeInterval(1640000.0)
        let remaining = task.remainingTime
        let remainingString = "\(remaining?.0 ?? 0) \(remaining?.1.rawValue ?? "")"

        XCTAssertEqual(remainingString, "3 week", "Remaining time calculation for task is incorrect")
    }

    func testRemaining3Months() {
        task.deadline = Date().addingTimeInterval(8294400.0)
        let remaining = task.remainingTime
        let remainingString = "\(remaining?.0 ?? 0) \(remaining?.1.rawValue ?? "")"

        XCTAssertEqual(remainingString, "3 month", "Remaining time calculation for task is incorrect")
    }

    func testRemaining2Years() {
        task.deadline = Date().addingTimeInterval(66225600.0)
        let remaining = task.remainingTime
        let remainingString = "\(remaining?.0 ?? 0) \(remaining?.1.rawValue ?? "")"

        XCTAssertEqual(remainingString, "2 year", "Remaining time calculation for task is incorrect")
    }

    func testIsOverdue() {
        task.deadline = Date().addingTimeInterval(-1)
        let isOverdue = task.isOverdue

        XCTAssertEqual(isOverdue, true, "Task should be overdue.")
    }

    func testIsNotOverdue() {
        task.deadline = Date().addingTimeInterval(1)
        let isOverdue = task.isOverdue

        XCTAssertEqual(isOverdue, false, "Task should not be overdue.")
    }

    func testDateEqualsDeadline() {
        task.deadline = Date()
        let isOverdue = task.isOverdue

        XCTAssertEqual(isOverdue, true, "Task should be overdue.")
    }
}
