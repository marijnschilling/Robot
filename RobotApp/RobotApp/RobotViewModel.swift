//
// Created by Marijn Schilling on 06/12/2020.
// Copyright (c) 2020 Marijn Schilling. All rights reserved.
//

import Foundation

enum Instruction: String {
    case forward = "F"
    case left = "L"
    case right = "R"
}

class RobotViewModel {
    private var robot: Robot
    private var instructions: String
    private let gridSize: (width: Int, height: Int)

    var finalPosition = ""

    init(robot: Robot, instructions: String, gridSize: (width: Int, height: Int)) {
        self.robot = robot
        self.instructions = instructions
        self.gridSize = gridSize
    }

    func moveRobot() -> String {
        instructions.forEach {
            switch Instruction(rawValue: String($0)) {
            case .forward:
                moveRobotForward()
            case .left:
                turnRobotLeft()
            case .right:
                turnRobotRight()
            case .none:
                assertionFailure("Invalid string")
            }
        }

        return "Final position is: \(robot.position.x) \(robot.position.y) \(robot.direction.rawValue)"
    }

    private func turnRobotRight() {
        guard let newDirection = Direction(rawValue: (robot.direction.rawValue + 1) % 4) else { return }
        robot.direction = newDirection
    }

    private func turnRobotLeft() {
        guard let newDirection = Direction(rawValue: (robot.direction.rawValue + 3) % 4) else { return }
        robot.direction = newDirection
    }

    private func moveRobotForward() {
        switch robot.direction {
        case .north:
            guard robot.position.y > 1 else { return }
            robot.position.y -= 1
        case .east:
            guard robot.position.x < gridSize.width else { return }
            robot.position.x += 1
        case .south:
            guard robot.position.y < gridSize.height else { return }
            robot.position.y += 1
        case .west:
            guard robot.position.x > 1 else { return }
            robot.position.x -= 1
        }
    }
}

extension RobotViewModel: Equatable {
    static func == (lhs: RobotViewModel, rhs: RobotViewModel) -> Bool {
        lhs.robot == rhs.robot && lhs.gridSize == rhs.gridSize
    }
}