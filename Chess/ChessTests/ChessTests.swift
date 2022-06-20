//
//  ChessTests.swift
//  ChessTests
//
//  Created by herb.salt on 2022/06/20.
//

import XCTest
@testable import Chess

class ChessTests: XCTestCase {

    // black Pawn이 white Pawn 하나를 잡은 상황
    func testIfScoreIsCorrect() throws {
        let board = Board()
        
        board.move(from: "A2", to: "A3")
        board.move(from: "A7", to: "A6")
        board.move(from: "A3", to: "A4")
        board.move(from: "A6", to: "A5")
        board.move(from: "A4", to: "A5")
        
        XCTAssertTrue(board.getScore(team: .white) == 7)
        XCTAssertTrue(board.getScore(team: .black) == 8)
    }
    
    func testIfPawnCannotMoveToSide() throws {
        let board = Board()
        
        XCTAssertTrue(board.isMovable(from: "A2", to: "B2") == false)
    }
    
    func testifPawnCannotMovetoBack() throws {
        let board = Board()
        
        XCTAssertTrue(board.isMovable(from: "A2", to: "A1") == false)
    }
}
