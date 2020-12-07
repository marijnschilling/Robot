//
// Created by Marijn Schilling on 06/12/2020.
// Copyright (c) 2020 Marijn Schilling. All rights reserved.
//

import Foundation

enum Direction: Int {

    case north
    case east
    case south
    case west

    var name: String {
       switch self {
       case .north:
           return "North"
       case .east:
           return "East"
       case .south:
           return "South"
       case .west:
           return "West"
       }
    }
}

struct Robot {
    var position: (x: Int, y: Int)
    var direction: Direction
}

extension Robot: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.position == rhs.position && lhs.direction.rawValue == rhs.direction.rawValue
    }
}