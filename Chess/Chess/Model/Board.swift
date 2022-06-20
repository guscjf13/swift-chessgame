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
        display()
    }
    
    // 체스 말 이동
    func move(from: String, to: String) {
        let fromCoordinate = from.toCoordinate()
        let toCoordinate = to.toCoordinate()
        
        let unit = units[fromCoordinate.y][fromCoordinate.x]
        
        if isMovable(from: from, to: to) {
            units[toCoordinate.y][toCoordinate.x] = unit
            units[fromCoordinate.y][fromCoordinate.x] = nil
            
            display()
        }
    }
    
    // 체스 말이 움직일 수 있는지 여부 반환
    func isMovable(from: String, to: String) -> Bool {
        guard let unit = units[from.toCoordinate().y][from.toCoordinate().x] else { return false }
        
        var isReachable = false
        let toCoordinate = to.toCoordinate()
        
        for movableLocation in unit.movableLocations(from: from) {
            if toCoordinate == movableLocation {
                isReachable = true
            }
        }
        if isReachable == false {
            return false
        }
        
        if units[toCoordinate.y][toCoordinate.x] == nil || units[toCoordinate.y][toCoordinate.x]?.team != unit.team {
            return true
        }
        
        return false
    }
    
    // 현재 보드상태 출력
    func display() {
        print("\n ABCDEFGH")
        for (index, unitLine) in units.enumerated() {
            print(index+1, terminator: "")
            for unit in unitLine {
                if let unit = unit {
                    print(unit.character, terminator: "")
                } else {
                    print(".", terminator: "")
                }
            }
            print()
        }
        print("흑팀 점수: \(getScore(team: .black))")
        print("백팀 점수: \(getScore(team: .white))")
    }
    
    func getScore(team: Team) -> Int {
        var score = 0
        for unitLine in units {
            for unit in unitLine {
                if let unit = unit {
                    if unit.team == team {
                        score += unit.score
                    }
                }
            }
        }
        
        return score
    }
}
