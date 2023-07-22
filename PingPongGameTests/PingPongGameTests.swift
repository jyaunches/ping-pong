//
//  PingPongGameTests.swift
//  PingPongGameTests
//
//  Created by Julietta Yaunches on 7/21/23.
//

import XCTest
@testable import PingPongGame

final class PingPongGameTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func setupMoves() -> [Move] {
        return [Move(joyStickLeft: .Neutral, joyStickRight: .Neutral),
        Move(joyStickLeft: .Neutral, joyStickRight: .Neutral),
        Move(joyStickLeft: .Neutral, joyStickRight: .Neutral),
        Move(joyStickLeft: .Neutral, joyStickRight: .Neutral),
        Move(joyStickLeft: .Neutral, joyStickRight: .Neutral),
        Move(joyStickLeft: .Neutral, joyStickRight: .Neutral)]
    }
    
    
    // no y velocity to start, just send back and forth at center of y
    func testPaddlesCanSendBallBackAndForthAtCenterX() throws {
        let board = Board(dimensions: TwoDVector(x: 10.0, y: 5.0))
        let ball = Ball(coords: TwoDVector(x: 5.0, y: 2.5), velocity: TwoDVector(x: 1.0, y: 0))
        
        // position left paddle at left of edge of board, velocity positive to send opposite direction
        let paddleLeft = Paddle(coords: TwoDVector(x: 10.0, y: 2.5), velocity: TwoDVector(x: 1.0, y: 0))
        
        // position right paddle at right of edge of board, velocity negative to send opposite direction
        let paddleRight = Paddle(coords: TwoDVector(x: 0.0, y: 2.5), velocity: TwoDVector(x: -1.0, y: 0))
        
        let game = Game(ball: ball, paddleLeft: paddleLeft, paddleRight: paddleRight, board: board)
        
        game.processMoves(moves: setupMoves())
        
        XCTAssertEqual(ball.velocity.x, -1.0)  //
    }

    

}
