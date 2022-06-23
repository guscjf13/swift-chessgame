//
//  Pawn.swift
//  Chess
//
//  Created by herb.salt on 2022/06/20.
//

import Foundation

class Pawn: Unit {
    
    var score: Int = 1
    var team: Team
    var character: String {
        switch team {
        case .black:
            return "\u{265F}"
        case .white:
            return "\u{2659}"
        }
    }
    
    init(team: Team) {
        self.team = team
    }
    
    func movableLocations(from: String) -> [Coordinate] {
        let fromCoordinate = from.toCoordinate()
        
        switch team {
        case .black:
            return [Coordinate(x: fromCoordinate.x, y: fromCoordinate.y+1)]
        case .white:
            return [Coordinate(x: fromCoordinate.x, y: fromCoordinate.y-1)]
        }
    }
}
