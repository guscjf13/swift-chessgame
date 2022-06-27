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
        
        print("체스 보드를 초기화했습니다.")
    }
}
