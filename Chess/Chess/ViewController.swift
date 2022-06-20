//
//  ViewController.swift
//  Chess
//
//  Created by herb.salt on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {
    
    var board: Board?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        playChess()
    }
    
    func setUp() {
        board = Board()
    }
    
    func playChess() {
        guard let board = board else { return }
        
        board.move(from: "A2", to: "A3")
    }
}

