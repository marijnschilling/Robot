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
        var robot = Robot(gridSize: (x: 1, y: 1), position: (x: 0, y: 0), direction: .north)

        robot.move(instructions: "R")
        XCTAssertEqual(robot.direction, .east)
        robot.move(instructions: "R")
        XCTAssertEqual(robot.direction, .south)
        robot.move(instructions: "R")
        XCTAssertEqual(robot.direction, .west)
        robot.move(instructions: "R")
        XCTAssertEqual(robot.direction, .north)
    }

    func testExampleTurnLeft() {
        var robot = Robot(gridSize: (x: 1, y: 1), position: (x: 0, y: 0), direction: .north)

        robot.move(instructions: "L")
        XCTAssertEqual(robot.direction, .west)
        robot.move(instructions: "L")
        XCTAssertEqual(robot.direction, .south)
        robot.move(instructions: "L")
        XCTAssertEqual(robot.direction, .east)
        robot.move(instructions: "L")
        XCTAssertEqual(robot.direction, .north)
    }

    func testTurns() {
        var robot = Robot(gridSize: (x: 1, y: 1), position: (x: 0, y: 0), direction: .north)

        robot.move(instructions: "LL")
        XCTAssertEqual(robot.direction, .south)
        robot.move(instructions: "RR")
        XCTAssertEqual(robot.direction, .north)
        robot.move(instructions: "LRR")
        XCTAssertEqual(robot.direction, .east)
        robot.move(instructions: "RLL")
        XCTAssertEqual(robot.direction, .north)

        robot.move(instructions: "RLLRLLLLLLRRR")
        XCTAssertEqual(robot.direction, .east)
        robot.move(instructions: "RRLLLLLRRRRRLLLRLRLLLRRRRRRRR")
        XCTAssertEqual(robot.direction, .south)
    }

    func testMoveNorth() {
        var robot = Robot(gridSize: (x: 2, y: 2), position: (x: 0, y: 0), direction: .north)
        robot.move(instructions: "F")

        XCTAssertEqual(robot.position.x, 0)
        XCTAssertEqual(robot.position.y, 1)
    }

    func testMoveNorthOutOfBounds() {
        var robot = Robot(gridSize: (x: 2, y: 2), position: (x: 0, y: 0), direction: .north)
        robot.move(instructions: "FF")

        XCTAssertEqual(robot.position.x, 0)
        XCTAssertEqual(robot.position.y, 1)
    }

    func testMoveEast() {
        var robot = Robot(gridSize: (x: 2, y: 2), position: (x: 0, y: 0), direction: .east)
        robot.move(instructions: "F")

        XCTAssertEqual(robot.position.x, 1)
        XCTAssertEqual(robot.position.y, 0)
    }

    func testMoveEastOutOfBounds() {
        var robot = Robot(gridSize: (x: 2, y: 2), position: (x: 0, y: 0), direction: .east)
        robot.move(instructions: "FF")

        XCTAssertEqual(robot.position.x, 1)
        XCTAssertEqual(robot.position.y, 0)
    }

    func testMoveSouth() {
        var robot = Robot(gridSize: (x: 2, y: 2), position: (x: 0, y: 1), direction: .south)
        robot.move(instructions: "F")

        XCTAssertEqual(robot.position.x, 0)
        XCTAssertEqual(robot.position.y, 0)
    }

    func testMoveSouthOutOfBounds() {
        var robot = Robot(gridSize: (x: 2, y: 2), position: (x: 0, y: 1), direction: .south)
        robot.move(instructions: "FF")

        XCTAssertEqual(robot.position.x, 0)
        XCTAssertEqual(robot.position.y, 0)
    }

    func testMoveWest() {
        var robot = Robot(gridSize: (x: 2, y: 2), position: (x: 1, y: 0), direction: .west)
        robot.move(instructions: "F")

        XCTAssertEqual(robot.position.x, 0)
        XCTAssertEqual(robot.position.y, 0)
    }

    func testMoveWestOutOfBounds() {
        var robot = Robot(gridSize: (x: 2, y: 2), position: (x: 1, y: 0), direction: .west)
        robot.move(instructions: "FF")

        XCTAssertEqual(robot.position.x, 0)
        XCTAssertEqual(robot.position.y, 0)
    }

    func testExample1() {
//        • Starting the program with a 5x5 room, and start position (1,2,N)
//        • The instructions RFRFFRFRF will result in the report 1 3 N

        var robot = Robot(gridSize: (x: 5, y: 5), position: (x: 1, y: 2), direction: .north)
        robot.move(instructions: "RFRFFRFRF")

        XCTAssertEqual(robot.position.x, 1)
        XCTAssertEqual(robot.position.y, 3)
        XCTAssertEqual(robot.direction, .north)
    }

    func testExample2() {
//        • Starting the program with a 5x5 room, and start position (0,0,E)
//        • The instructions RFLFFLRF will result in the report 3 1 E

        var robot = Robot(gridSize: (x: 5, y: 5), position: (x: 0, y: 0), direction: .east)
        robot.move(instructions: "RFLFFLRF")

        XCTAssertEqual(robot.position.x, 3)
        XCTAssertEqual(robot.position.y, 1)
        XCTAssertEqual(robot.direction, .east)
    }
}
