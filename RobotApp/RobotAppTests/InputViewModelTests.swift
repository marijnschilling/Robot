//
// Created by Marijn Schilling on 07/12/2020.
// Copyright (c) 2020 Marijn Schilling. All rights reserved.
//

import Foundation
import XCTest

@testable import RobotApp

class InputViewModelTestsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidateGridWidth() {
        let inputZero = InputViewModel(gridWidth: 0, gridHeight: 0, xPosition: 0, yPosition: 0, direction: 0, instructions: "")
        XCTAssertEqual(inputZero.validate(), InputValidationResult.failure(.invalidGridWidth))
        let inputTen = InputViewModel(gridWidth: 10, gridHeight: 0, xPosition: 0, yPosition: 0, direction: 0, instructions: "")
        XCTAssertEqual(inputTen.validate(), InputValidationResult.failure(.invalidGridWidth))
    }

    func testValidateGridHeight() {
        let inputZero = InputViewModel(gridWidth: 2, gridHeight: 0, xPosition: 0, yPosition: 0, direction: 0, instructions: "")
        XCTAssertEqual(inputZero.validate(), InputValidationResult.failure(.invalidGridHeight))
        let inputTen = InputViewModel(gridWidth: 2, gridHeight: 10, xPosition: 0, yPosition: 0, direction: 0, instructions: "")
        XCTAssertEqual(inputTen.validate(), InputValidationResult.failure(.invalidGridHeight))
    }

    func testValidateXPosition() {
        let inputZero = InputViewModel(gridWidth: 2, gridHeight: 2, xPosition: 0, yPosition: 0, direction: 0, instructions: "")
        XCTAssertEqual(inputZero.validate(), InputValidationResult.failure(.invalidXPosition))
        let inputBiggerThenGridWidth = InputViewModel(gridWidth: 2, gridHeight: 2, xPosition: 3, yPosition: 0, direction: 0, instructions: "")
        XCTAssertEqual(inputBiggerThenGridWidth.validate(), InputValidationResult.failure(.invalidXPosition))
    }

    func testValidateYPosition() {
        let inputZero = InputViewModel(gridWidth: 2, gridHeight: 2, xPosition: 2, yPosition: 0, direction: 0, instructions: "")
        XCTAssertEqual(inputZero.validate(), InputValidationResult.failure(.invalidYPosition))
        let inputBiggerThenGridHeight = InputViewModel(gridWidth: 2, gridHeight: 2, xPosition: 2, yPosition: 3, direction: 0, instructions: "")
        XCTAssertEqual(inputBiggerThenGridHeight.validate(), InputValidationResult.failure(.invalidYPosition))
    }

    func testValidateDirection() {
        let inputInvalidDirection = InputViewModel(gridWidth: 2, gridHeight: 2, xPosition: 2, yPosition: 2, direction: 5, instructions: "")
        XCTAssertEqual(inputInvalidDirection.validate(), InputValidationResult.failure(.invalidDirection))
    }

    func testValidateInstructions() {
        let inputZero = InputViewModel(gridWidth: 2, gridHeight: 2, xPosition: 2, yPosition: 2, direction: 0, instructions: "a")
        XCTAssertEqual(inputZero.validate(), InputValidationResult.failure(.invalidInstructions))
    }

    func testValidInput() {
        let validInput = InputViewModel(gridWidth: 2, gridHeight: 2, xPosition: 1, yPosition: 1, direction: 0, instructions: "L")
        XCTAssertEqual(validInput.validate(), InputValidationResult.success(RobotViewModel(robot: Robot(position: (x: 1, y: 1), direction: .north), gridSize: (width: 2, height: 2))))
    }
}
