//
// Created by Marijn Schilling on 07/12/2020.
// Copyright (c) 2020 Marijn Schilling. All rights reserved.
//

import Foundation

enum InputError: Error {
    case invalidGridWidth
    case invalidGridHeight
    case invalidXPosition
    case invalidYPosition
    case invalidDirection
    case invalidInstructions

    var errorMessage: String {
        switch self {
        case .invalidGridWidth:
            return "Enter a value between 1-9"
        case .invalidGridHeight:
            return "Enter a value between 1-9"
        case .invalidXPosition:
            return "Enter a value between 1 and the width of the grid"
        case .invalidYPosition:
            return "Enter a value between 1 and the height of the grid"
        case .invalidDirection:
            return "Enter N for north E for East S for South or W for West"
        case .invalidInstructions:
            return "Enter a string of L F or R values"
        }
    }
}

typealias InputValidationResult = Result<RobotViewModel, InputError>

struct InputViewModel {
    let gridWidth: Int?
    let gridHeight: Int?
    let xPosition: Int?
    let yPosition: Int?
    let direction: Int?
    let instructions: String?

    func validate() -> InputValidationResult {
        guard let gridWidth = gridWidth, gridWidth > 0 && gridWidth < 10 else { return .failure(.invalidGridWidth) }
        guard let gridHeight = gridHeight, gridHeight > 0 && gridHeight < 10 else { return .failure(.invalidGridHeight) }
        guard let xPosition = xPosition, xPosition > 0 && xPosition <= gridWidth else { return .failure(.invalidXPosition) }
        guard let yPosition = yPosition, yPosition > 0 && yPosition <= gridHeight else { return .failure(.invalidYPosition) }

        guard let rawDirection = direction, let validDirection = Direction(rawValue: rawDirection) else { return .failure(.invalidDirection)}
        guard let instructions = instructions, (instructions.uppercased().allSatisfy { "LRF".contains($0) } == true) else { return .failure(.invalidInstructions)}

        let robot = Robot(position: (x: xPosition, y: yPosition), direction: validDirection)
        return .success(RobotViewModel(robot: robot, gridSize: (width: gridWidth, gridHeight)))
    }
}