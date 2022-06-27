//
//  Queen.swift
//  Chess
//
//  Created by herb.salt on 2022/06/27.
//

import Foundation

class Queen: Unit {
    
    var score: Int = 9
    var team: Team
    var character: String {
        switch team {
        case .black:
            return "\u{265B}"
        case .white:
            return "\u{2655}"
        }
    }
    
    init(team: Team) {
        self.team = team
    }
    
    func movableLocations(from: Coordinate, board: Board) -> [Coordinate] {
        var movableArr: [Coordinate] = []
        
        let rook = Rook(team: .white)
        let biship = Biship(team: .white)
        
        for movablePlace in rook.movableLocations(from: from, board: board) {
            movableArr.append(movablePlace)
        }
        for movablePlace in biship.movableLocations(from: from, board: board) {
            movableArr.append(movablePlace)
        }
        
        return movableArr
    }
}

