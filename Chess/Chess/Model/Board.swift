//
//  Board.swift
//  Chess
//
//  Created by herb.salt on 2022/06/20.
//

import Foundation

class Board {
    
    var units: [[Unit?]]
    
    // 체스 말 생성
    init() {
        units = Array(repeating: Array(repeating: nil,count: 8), count: 8)
        for index in 0...7 {
            units[1][index] = Pawn(team: .black)
            units[6][index] = Pawn(team: .white)
        }
        
        units[0][0] = Rook(team: .black)
        units[0][7] = Rook(team: .black)
        
        units[0][1] = Knight(team: .black)
        units[0][6] = Knight(team: .black)
        
        units[0][2] = Biship(team: .black)
        units[0][5] = Biship(team: .black)
        
        units[0][4] = Queen(team: .black)
        
        units[7][0] = Rook(team: .white)
        units[7][7] = Rook(team: .white)
        
        units[7][1] = Knight(team: .white)
        units[7][6] = Knight(team: .white)
        
        units[7][2] = Biship(team: .white)
        units[7][5] = Biship(team: .white)
        
        units[7][4] = Queen(team: .white)
        
        print("체스 보드를 초기화했습니다.")
    }
}
