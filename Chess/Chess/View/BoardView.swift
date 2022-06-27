//
//  BoardView.swift
//  Chess
//
//  Created by herb.salt on 2022/06/27.
//

import Foundation
import UIKit

class BoardView: UIView {
    
    var board: Board
    
    override init(frame: CGRect) {
        board = Board()
        super.init(frame: frame)
        
        display()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 체스 말 이동
    func move(from: String, to: String) {
        let fromCoordinate = from.toCoordinate()
        let toCoordinate = to.toCoordinate()
        
        let unit = board.units[fromCoordinate.y][fromCoordinate.x]
        
        if isMovable(from: fromCoordinate, to: toCoordinate) {
            board.units[toCoordinate.y][toCoordinate.x] = unit
            board.units[fromCoordinate.y][fromCoordinate.x] = nil
            
            display()
        }
    }
    
    // 체스 말이 움직일 수 있는지 여부 반환
    func isMovable(from: Coordinate, to: Coordinate) -> Bool {
        guard let unit = board.units[from.y][from.x] else { return false }
        
        var isReachable = false
        
        for movableLocation in unit.movableLocations(from: from) {
            if to == movableLocation {
                isReachable = true
            }
        }
        if isReachable == false {
            return false
        }
        
        if board.units[to.y][to.x] == nil || board.units[to.y][to.x]?.team != unit.team {
            return true
        }
        
        return false
    }
    
    // 현재 보드상태 출력
    func display() {
        print("\n ABCDEFGH")
        for (index, unitLine) in board.units.enumerated() {
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
        for unitLine in board.units {
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
