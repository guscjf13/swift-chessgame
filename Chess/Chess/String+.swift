//
//  String+.swift
//  Chess
//
//  Created by herb.salt on 2022/06/20.
//

import Foundation

extension String {
    func toCoordinate() -> Coordinate {
        guard self.count == 2 else {
            return Coordinate(x: -1, y: -1)
        }
        
        let fileCharacter = self[self.startIndex]
        let rank = Int(String(self[self.index(before: self.endIndex)]))!
        
        var file = 0
        switch fileCharacter {
        case "A":
            file = 0
        case "B":
            file = 1
        case "C":
            file = 2
        case "D":
            file = 3
        case "E":
            file = 4
        case "F":
            file = 5
        case "G":
            file = 6
        case "H":
            file = 7
        default:
            file = 0
        }
        
//        A2 = 1 0
//        B2 = 1 1
//        C2 = 1 2
        return Coordinate(x: file, y: rank-1)
    }
}
