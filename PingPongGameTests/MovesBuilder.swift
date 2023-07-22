//
//  MovesBuilder.swift
//  PingPongGameTests
//
//  Created by Julietta Yaunches on 7/22/23.
//

import Foundation
@testable import PingPongGame

class MovesBuilder {
    
    var moves: [Move] = []
    
    func addMove(_ move: Move) -> MovesBuilder {
        moves.append(move)
        return self
    }
    
    func addNeutralMoves(_ times: Int) -> MovesBuilder {
        for _ in 1...times {
            moves.append(Move(joyStickLeft: .Neutral, joyStickRight: .Neutral))
        }
        return self
    }
    
    func build() -> [Move] {
        return moves
    }
}
