//
// Created by Marijn Schilling on 06/12/2020.
// Copyright (c) 2020 Marijn Schilling. All rights reserved.
//

import Foundation

enum Direction {
    case north
    case east
    case south
    case west
}

enum Instruction: String {
    case forward = "F"
    case left = "L"
    case right = "R"
}

struct Robot {
    let gridSize: (x: Int, y: Int)
    var position: (x: Int, y: Int)
    var direction: Direction

    public mutating func move(instructions: String) {
        instructions.forEach {
            switch Instruction(rawValue: String($0)) {
            case .forward:
                moveForward()
            case .left:
                turnLeft()
            case .right:
                turnRight()
            case .none:
                assertionFailure("Invalid string")
            }
        }
    }

    private mutating func turnRight() {
        switch direction {
        case .north:
            direction = .east
        case .east:
            direction = .south
        case .south:
            direction = .west
        case .west:
            direction = .north
        }
    }

    private mutating func turnLeft() {
        switch direction {
        case .north:
            direction = .west
        case .east:
            direction = .north
        case .south:
            direction = .east
        case .west:
            direction = .south
        }
    }

    private mutating func moveForward() {}
}