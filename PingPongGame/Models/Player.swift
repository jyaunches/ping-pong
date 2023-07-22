//
//  Player.swift
//  PingPongGame
//
//  Created by Julietta Yaunches on 7/21/23.
//

import Foundation

// player 1: left
// player 2: right
class Player {
    var score: Int
    var paddle: Paddle
    
    init(score: Int, paddle: Paddle) {
        self.score = score
        self.paddle = paddle
    }
}
