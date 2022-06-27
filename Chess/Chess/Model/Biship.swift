//
//  Biship.swift
//  Chess
//
//  Created by herb.salt on 2022/06/27.
//

import Foundation

class Biship: Unit {
    
    var score: Int = 3
    var team: Team
    var character: String {
        switch team {
        case .black:
            return "\u{265D}"
        case .white:
            return "\u{2657}"
        }
    }
    
    init(team: Team) {
        self.team = team
    }
    
    func movableLocations(from: Coordinate, board: Board) -> [Coordinate] {
        var movableArr: [Coordinate] = []
        
        // direction
        // 0: upLeft    (x-1, y-1)
        // 1: upRight   (x+1, y-1)
        // 2: downLeft  (x-1, y+1)
        // 3: downRight (x+1, y+1)
        for direction in 0...3 {
            for index in 1...7 {
                let xDirection = direction % 2 == 0 ? -index : index
                let yDirection = direction <= 1 ? -index : index
                let to = Coordinate(x: xDirection, y: yDirection)
                if to.isInBoard {
                    movableArr.append(to)
                }
            }
        }
        
        return movableArr
    }
}

