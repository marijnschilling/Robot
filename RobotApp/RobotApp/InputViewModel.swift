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

typealias InputValidationResult = Result<Bool, InputError>

struct InputViewModel {
    let gridWidth: Int?
    let gridHeight: Int?
    let xPosition: Int?
    let yPosition: Int?
    let direction: String?
    let instructions: String?

    func validate() -> InputValidationResult {
        return .success(true)
    }
}