//
//  Unit.swift
//  Chess
//
//  Created by herb.salt on 2022/06/20.
//

import Foundation

class Unit {
    
    var character: String {
        return "."
    }
    
    var score: Int {
        return 0
    }
    
    var team: Team
    
    init(team: Team) {
        self.team = team
    }
    
    func movableLocations(from: String) -> [Coordinate] {
        return []
    }
}

enum Team: String {
    case white
    case black
}

class Coordinate: Equatable {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
