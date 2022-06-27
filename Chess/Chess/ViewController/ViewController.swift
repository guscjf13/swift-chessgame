//
//  ViewController.swift
//  Chess
//
//  Created by herb.salt on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {
    
    var boardView: BoardView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        playChess()
    }
    
    func setUp() {
        boardView = BoardView()
    }
    
    func playChess() {
        guard let boardView = boardView else { return }
        
//        board.move(from: "A2", to: "A3")
    }
}

