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
    
    func movableLocations(from: Coordinate) -> [Coordinate]
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
