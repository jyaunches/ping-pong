//
//  GameObject.swift
//  PingPongGame
//
//  Created by Julietta Yaunches on 7/21/23.
//

import Foundation

struct TwoDVector {
    var x: Float
    var y: Float
}

protocol GameObject {
    var coords: TwoDVector { get set }
    var velocity: TwoDVector { get set }
}

class Paddle : GameObject {
    var coords: TwoDVector
    var velocity: TwoDVector
    
    init(coords: TwoDVector, velocity: TwoDVector) {
        self.coords = coords
        self.velocity = velocity
    }
}

class Ball : GameObject {
    var coords: TwoDVector
    var velocity: TwoDVector
    
    init(coords: TwoDVector, velocity: TwoDVector) {
        self.coords = coords
        self.velocity = velocity
    }
    
    func isImpactedWithRightObjectAt(_ objectCoors: TwoDVector) -> Bool {
        return coords.x >= objectCoors.x
    }
    
    func moveForward() {
        let currentX = coords.x
        let currentY = coords.y
        
        coords = TwoDVector(x: currentX + (1 * velocity.x), y: currentY + (1 * velocity.y))                
    }
}

class Board {
    var dimensions: TwoDVector
    
    init(dimensions: TwoDVector) {
        self.dimensions = dimensions
    }
}
