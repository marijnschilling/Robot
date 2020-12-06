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
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .north), gridSize: (width: 1, height: 1))

        var robot = robotViewModel.moveRobot(instructions: "R")
        XCTAssertEqual(robot.direction, .east)
        robot = robotViewModel.moveRobot(instructions: "R")
        XCTAssertEqual(robot.direction, .south)
        robot = robotViewModel.moveRobot(instructions: "R")
        XCTAssertEqual(robot.direction, .west)
        robot = robotViewModel.moveRobot(instructions: "R")
        XCTAssertEqual(robot.direction, .north)
    }

    func testExampleTurnLeft() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .north), gridSize: (width: 1, height: 1))

        var robot = robotViewModel.moveRobot(instructions: "L")
        XCTAssertEqual(robot.direction, .west)
        robot = robotViewModel.moveRobot(instructions: "L")
        XCTAssertEqual(robot.direction, .south)
        robot = robotViewModel.moveRobot(instructions: "L")
        XCTAssertEqual(robot.direction, .east)
        robot = robotViewModel.moveRobot(instructions: "L")
        XCTAssertEqual(robot.direction, .north)
    }

    func testTurns() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .north), gridSize: (width: 1, height: 1))

        var robot = robotViewModel.moveRobot(instructions: "LL")
        XCTAssertEqual(robot.direction, .south)
        robot = robotViewModel.moveRobot(instructions: "RR")
        XCTAssertEqual(robot.direction, .north)
        robot = robotViewModel.moveRobot(instructions: "LRR")
        XCTAssertEqual(robot.direction, .east)
        robot = robotViewModel.moveRobot(instructions: "RLL")
        XCTAssertEqual(robot.direction, .north)

        robot = robotViewModel.moveRobot(instructions: "RLLRLLLLLLRRR")
        XCTAssertEqual(robot.direction, .east)
        robot = robotViewModel.moveRobot(instructions: "RRLLLLLRRRRRLLLRLRLLLRRRRRRRR")
        XCTAssertEqual(robot.direction, .south)
    }

    func testMoveNorth() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 1, y: 2), direction: .north), gridSize: (width: 2, height: 2))

        let robot = robotViewModel.moveRobot(instructions: "F")

        XCTAssertEqual(robot.position.x, 1)
        XCTAssertEqual(robot.position.y, 1)
    }

    func testMoveNorthOutOfBounds() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 1, y: 2), direction: .north), gridSize: (width: 2, height: 2))

        let robot = robotViewModel.moveRobot(instructions: "FF")

        XCTAssertEqual(robot.position.x, 1)
        XCTAssertEqual(robot.position.y, 1)
    }

    func testMoveEast() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 1, y: 1), direction: .east), gridSize: (width: 2, height: 2))

        let robot = robotViewModel.moveRobot(instructions: "F")

        XCTAssertEqual(robot.position.x, 2)
        XCTAssertEqual(robot.position.y, 1)
    }

    func testMoveEastOutOfBounds() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 1, y: 1), direction: .east), gridSize: (width: 2, height: 2))

        let robot = robotViewModel.moveRobot(instructions: "FF")

        XCTAssertEqual(robot.position.x, 2)
        XCTAssertEqual(robot.position.y, 1)
    }

    func testMoveSouth() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 1, y: 1), direction: .south), gridSize: (width: 2, height: 2))

        let robot = robotViewModel.moveRobot(instructions: "F")

        XCTAssertEqual(robot.position.x, 1)
        XCTAssertEqual(robot.position.y, 2)
    }

    func testMoveSouthOutOfBounds() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 1, y: 1), direction: .south), gridSize: (width: 2, height: 2))

        let robot = robotViewModel.moveRobot(instructions: "FF")

        XCTAssertEqual(robot.position.x, 1)
        XCTAssertEqual(robot.position.y, 2)
    }

    func testMoveWest() {
        let robotViewModel = RobotViewModel(robot: Robot( position: (x: 2, y: 1), direction: .west), gridSize: (width: 2, height: 2))

        let robot = robotViewModel.moveRobot(instructions: "F")

        XCTAssertEqual(robot.position.x, 1)
        XCTAssertEqual(robot.position.y, 1)
    }

    func testMoveWestOutOfBounds() {
        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 2, y: 1), direction: .west), gridSize: (width: 2, height: 2))

        let robot = robotViewModel.moveRobot(instructions: "FF")

        XCTAssertEqual(robot.position.x, 1)
        XCTAssertEqual(robot.position.y, 1)
    }

    func testExample1() {
//        • Starting the program with a 5x5 room, and start position (1,2,N)
//        • The instructions RFRFFRFRF will result in the report 1 3 N

        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 1, y: 2), direction: .north), gridSize: (width: 5, height: 5))

        let robot = robotViewModel.moveRobot(instructions: "RFRFFRFRF")

        XCTAssertEqual(robot.position.x, 1)
        XCTAssertEqual(robot.position.y, 3)
        XCTAssertEqual(robot.direction, .north)
    }

    func testExample2() {
//        • Starting the program with a 5x5 room, and start position (0,0,E)
//        • The instructions RFLFFLRF will result in the report 3 1 E

        let robotViewModel = RobotViewModel(robot: Robot(position: (x: 0, y: 0), direction: .east), gridSize: (width: 5, height: 5))

        let robot = robotViewModel.moveRobot(instructions: "RFLFFLRF")

        XCTAssertEqual(robot.position.x, 3)
        XCTAssertEqual(robot.position.y, 1)
        XCTAssertEqual(robot.direction, .east)
    }
}
