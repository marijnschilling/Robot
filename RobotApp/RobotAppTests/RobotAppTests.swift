//
//  RobotAppTests.swift
//  RobotAppTests
//
//  Created by Marijn Schilling on 06/12/2020.
//  Copyright © 2020 Marijn Schilling. All rights reserved.
//

import XCTest
@testable import RobotApp

class RobotAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExampleTurnRight() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .north), instructions: "R", gridSize: (width: 1, height: 1))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 0 0 1")
    }

    func testExampleTurnLeft() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .north), instructions: "L", gridSize: (width: 1, height: 1))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 0 0 3")
    }

    func testTurns() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .north), instructions: "LL", gridSize: (width: 1, height: 1))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 0 0 2")
    }

    func testMoveNorth() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 1), direction: .north), instructions: "F", gridSize: (width: 2, height: 2))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 0 0 0")
    }

    func testMoveNorthOutOfBounds() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 1), direction: .north), instructions: "FF", gridSize: (width: 2, height: 2))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 0 0 0")
    }

    func testMoveEast() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .east), instructions: "F", gridSize: (width: 2, height: 2))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 1 0 1")
    }

    func testMoveEastOutOfBounds() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .east), instructions: "FF",  gridSize: (width: 2, height: 2))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 1 0 1")
    }

    func testMoveSouth() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .south), instructions: "F", gridSize: (width: 2, height: 2))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 0 1 2")
    }

    func testMoveSouthOutOfBounds() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .south), instructions: "FF", gridSize: (width: 2, height: 2))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 0 1 2")
    }

    func testMoveWest() {
        let robotViewModel = RobotViewModel(robot: Robot( position: (x: 1, y: 0), direction: .west), instructions: "F", gridSize: (width: 2, height: 2))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 0 0 3")
    }

    func testMoveWestOutOfBounds() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 1, y: 0), direction: .west), instructions: "FF", gridSize: (width: 2, height: 2))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 0 0 3")
    }

    func testExample1() {
//        • Starting the program with a 5x5 room, and start position (1,2,N)
//        • The instructions RFRFFRFRF will result in the report 1 3 N

        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 1, y: 2), direction: .north), instructions: "RFRFFRFRF", gridSize: (width: 5, height: 5))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 1 3 0")
    }

    func testExample2() {
//        • Starting the program with a 5x5 room, and start position (0,0,E)
//        • The instructions RFLFFLRF will result in the report 3 1 E

        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .east), instructions: "RFLFFLRF", gridSize: (width: 5, height: 5))

        let endPosition = robotViewModel.moveRobot()

        XCTAssertEqual(endPosition, "Final position is: 3 1 1")
    }
}
