//
//  PingPongGameTests.swift
//  PingPongGameTests
//
//  Created by Julietta Yaunches on 7/21/23.
//

import XCTest
@testable import PingPongGame

final class PingPongGameTests: XCTestCase {

    let board = Board(dimensions: TwoDVector(x: 10.0, y: 5.0))
    let ball = Ball(coords: TwoDVector(x: 5.0, y: 2.5), velocity: TwoDVector(x: 1.0, y: 0))
    
    // position right paddle at left of edge of board, velocity positive to send opposite direction
    let paddleRight = Paddle(coords: TwoDVector(x: 10.0, y: 2.5), velocity: TwoDVector(x: 1.0, y: 0))
    // position left paddle at right of edge of board, velocity negative to send opposite direction
    let paddleLeft = Paddle(coords: TwoDVector(x: 0.0, y: 2.5), velocity: TwoDVector(x: -1.0, y: 0))
    
    
    var game: Game?
    override func setUpWithError() throws {
        
        game = Game(ball: ball, paddleLeft: paddleLeft, paddleRight: paddleRight, board: board)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // NOTE: TESTING W/ NO Y VELOCITY
    // These tests have a static y velocity to start, just send back and forth at center of y
    func testOnRightPaddleInteractingWithBallItsVelocityReverses() throws {
        let moves = MovesBuilder().addNeutralMoves(6).build()
        _ = game?.processMoves(moves: moves)
        
        XCTAssertEqual(ball.velocity.x, -1.0)
    }
    
    func testOnLeftPaddleInteractingWithBallItsVelocityReverses() throws {
        let moves = MovesBuilder().addNeutralMoves(16).build()
        game?.processMoves(moves: moves)
        
        XCTAssertEqual(ball.velocity.x, 1.0)
    }
    
    func testWhenBallGoesOffBoardScoreIncreasesForOffender() {
        XCTAssertEqual(game!.paddleLeft.score, 0)
        let moves = MovesBuilder()
                    .addMove(Move(joyStickLeft: .Neutral, joyStickRight: .Up))
                    .addNeutralMoves(5).build()
        _ = game?.processMoves(moves: moves)
        
        XCTAssertEqual(game!.paddleLeft.score, 1)
    }
    
    func testWhenPlayerWinsWinningResultIsReturned() {
        let moves = MovesBuilder()
                    .addMove(Move(joyStickLeft: .Neutral, joyStickRight: .Up))
                    .addNeutralMoves(5).build()
        XCTAssertTrue(game!.processMoves(moves: moves))
    }
    
    // func testOnBallGoesOffBoardAtTopBoundaryScoreIncrementsForPlayerRelativeToMiddleOfBoard()
    // func testOnBallGoesOffBoardAtBottomBoundaryScoreIncrementsForPlayerRelativeToMiddleOfBoard()

    // NOTE: END TESTING W/ NO Y VELOCITY
    
    /* NOTE: TESTING W/ Y VELOCITY
    
    func testOnRightPaddleInteractingWithBallHavingXAnd&VelocityItsVelocityReverses()
    func testOnLeftPaddleInteractingWithBallHavingXAnd&VelocityItsVelocityReverses()
    
    NOTE: END TESTING W/ Y VELOCITY */

    
}
