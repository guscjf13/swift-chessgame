//
//  ViewController.swift
//  Chess
//
//  Created by herb.salt on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {
    
    var board: Board = Board()
    var boardView: BoardView = BoardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardView.board = board
    }
}

