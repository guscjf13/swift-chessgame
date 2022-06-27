//
//  Rook.swift
//  Chess
//
//  Created by herb.salt on 2022/06/27.
//

import Foundation

class Rook: Unit {
    
    var score: Int = 5
    var team: Team
    var character: String {
        switch team {
        case .black:
            return "\u{265C}"
        case .white:
            return "\u{2656}"
        }
    }
    
    init(team: Team) {
        self.team = team
    }
    
    func movableLocations(from: Coordinate, board: Board) -> [Coordinate] {
        var movableArr: [Coordinate] = []
        
        // direction
        // 0: left  (x-1)
        // 1: up    (y-1)
        // 2: right (x+1)
        // 3: down  (y+1)
        for direction in 0...3 {
            for index in 1...7 {
                let xDirection = direction % 2 == 0 ? index * (direction - 1) : 0
                let yDirection = direction % 2 == 0 ? 0 : index * (direction - 2)
                let to = Coordinate(x: xDirection, y: yDirection)
                if to.isInBoard {
                    movableArr.append(to)
                }
            }
        }
        
        return movableArr
    }
}

