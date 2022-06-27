//
//  Knight.swift
//  Chess
//
//  Created by herb.salt on 2022/06/27.
//

import Foundation

class Knight: Unit {
    
    var score: Int = 3
    var team: Team
    var character: String {
        switch team {
        case .black:
            return "\u{265E}"
        case .white:
            return "\u{2658}"
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
            let xDirection = direction % 2 == 0 ? direction - 1 : 0
            let yDirection = direction % 2 == 0 ? 0 : direction - 2
            
            let OneSpaceForward = Coordinate(x: from.x + xDirection, y: from.y + yDirection)
            if OneSpaceForward.isInBoard {
                let OneMoreSpaceForward = Coordinate(x: OneSpaceForward.x + xDirection, y: OneSpaceForward.y + yDirection)
                if direction == 0 || direction == 2 {
                    let UpForward = Coordinate(x: OneMoreSpaceForward.x, y: OneMoreSpaceForward.y - 1)
                    let downForward = Coordinate(x: OneMoreSpaceForward.x, y: OneMoreSpaceForward.y + 1)
                    
                    if UpForward.isInBoard {
                        movableArr.append(UpForward)
                    }
                    if downForward.isInBoard {
                        movableArr.append(downForward)
                    }
                } else {
                    let leftForward = Coordinate(x: OneMoreSpaceForward.x - 1, y: OneMoreSpaceForward.y)
                    let rightForward = Coordinate(x: OneMoreSpaceForward.x + 1, y: OneMoreSpaceForward.y)
                    
                    if leftForward.isInBoard {
                        movableArr.append(leftForward)
                    }
                    if rightForward.isInBoard {
                        movableArr.append(rightForward)
                    }
                }
            }
        }
        
        return movableArr
    }
}

