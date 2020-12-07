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
            return "Enter a value between 0 and the width of the grid"
        case .invalidYPosition:
            return "Enter a value between 0 and the height of the grid"
        case .invalidDirection:
            return "Enter N for north E for East S for South or W for West"
        case .invalidInstructions:
            return "Enter a string containing L F or R"
        }
    }
}

typealias InputValidationResult = Result<RobotViewModel, InputError>

struct InputViewModel {
    let gridWidth: String?
    let gridHeight: String?
    let xPosition: String?
    let yPosition: String?
    let direction: Int?
    let instructions: String?

    func validate() -> InputValidationResult {
        guard let gridWidth = gridWidth, let width = Int(gridWidth), width > 0 && width < 10 else { return .failure(.invalidGridWidth) }
        guard let gridHeight = gridHeight, let height = Int(gridHeight), height > 0 && height < 10 else { return .failure(.invalidGridHeight) }
        guard let xPosition = xPosition, let x = Int(xPosition), x >= 0 && x <= (width - 1) else { return .failure(.invalidXPosition) }
        guard let yPosition = yPosition, let y = Int(yPosition), y >= 0 && y <= (height - 1) else { return .failure(.invalidYPosition) }

        guard let rawDirection = direction, let validDirection = Direction(rawValue: rawDirection) else { return .failure(.invalidDirection)}
        guard let instructions = instructions?.uppercased(), (instructions.allSatisfy { "LRF".contains($0) } == true) else { return .failure(.invalidInstructions)}

        let robot = Robot(position: (x: x, y: y), direction: validDirection)
        return .success(RobotViewModel(robot: robot, instructions: instructions, gridSize: (width: width, height)))
    }
}