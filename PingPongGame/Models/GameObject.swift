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
    var score: Int = 0
    
    init(coords: TwoDVector, velocity: TwoDVector) {
        self.coords = coords
        self.velocity = velocity
    }
    
    func incrementScore() {
        score += 1
    }
    
    func process(_ joyStickPosition: JoyStickPosition) {
        switch(joyStickPosition) {
        case .Down:
            coords.y -= 1
        case .Up:
            coords.y += 1
        case .Neutral:
            return
        }
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
        let impactOnYAxis = (coords.y == objectCoors.y || coords.y == objectCoors.y)
        return coords.x >= objectCoors.x && impactOnYAxis
    }
    
    func isImpactedWithLeftObjectAt(_ objectCoors: TwoDVector) -> Bool {
        let impactOnYAxis = (coords.y == objectCoors.y || coords.y == objectCoors.y)
        return coords.x <= 0 && impactOnYAxis
    }
    
    func hasPassedObjectOnRight(_ objectCoors: TwoDVector) -> Bool {
        return coords.x > objectCoors.x || coords.y > objectCoors.y
    }
    
    func hasPassedObjectOnLeft(_ objectCoors: TwoDVector) -> Bool {
        return coords.x < 0 || coords.y > 0
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
