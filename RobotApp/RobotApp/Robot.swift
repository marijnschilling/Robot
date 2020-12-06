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
}

struct Robot {
    var position: (x: Int, y: Int)
    var direction: Direction
}
