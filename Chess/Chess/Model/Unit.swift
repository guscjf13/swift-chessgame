//
//  Unit.swift
//  Chess
//
//  Created by herb.salt on 2022/06/20.
//

import Foundation

protocol Unit {
    var character: String { get }
    var score: Int { get }
    var team: Team { get }
    
    func movableLocations(from: Coordinate, board: Board) -> [Coordinate]
}

enum Team: String {
    case white
    case black
}

class Coordinate: Equatable {
    var x: Int
    var y: Int
    
    var isInBoard: Bool {
        return x >= 0 && x <= 7 && y >= 0 && y <= 7
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
