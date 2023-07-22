//
//  Game.swift
//  PingPongGame
//
//  Created by Julietta Yaunches on 7/21/23.
//

import Foundation

// Pong game
// Two paddles & a ball
// Game loop
// --> takes input from the players
// --> updates physics
// --> tests to see if anything impacted
// --> checks for a score
// --> checks for a winner

enum JoyStickPosition {
    case Up
    case Neutral
    case Down
}

struct Move {
    var joyStickLeft: JoyStickPosition
    var joyStickRight: JoyStickPosition
}

class Game {
    
    var ball: Ball          //coords & velocity
    var paddleLeft: Paddle     //coords & velocity
    var paddleRight: Paddle     //coords & velocity
    
    var board: Board
        
    init(ball: Ball, paddleLeft: Paddle, paddleRight: Paddle, board: Board) {
        self.ball = ball
        self.paddleLeft = paddleLeft
        self.paddleRight = paddleRight
        self.board = board
    }
    
    func processMoves(moves: [Move]) {
        for move in moves {
            ball.moveForward()
            processPaddleInput(move)
            updateGameComponents()
        }
    }
    
    private func processPaddleInput(_ move: Move) {
        
    }
    
    private func updateGameComponents() {
        // if ball hit y boundary -> process direction & velocity change of ball
        //   -- reverse ball y velocity
        // if ball impacted a paddle -> process velocity change of ball
        
        if ball.isImpactedWithRightObjectAt(paddleLeft.coords) {
            ball.velocity.x = ball.velocity.x * -1
        }
    }
}
