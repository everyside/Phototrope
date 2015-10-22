//
//  GameScene.swift
//  Phototrope
//
//  Created by Dani Pletter on 10/22/15.
//  Copyright (c) 2015 Everyside Innovations, LLC. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Dot   : UInt32 = 0b1
}

class GameScene: SKScene {

    let dot = SKShapeNode(circleOfRadius: 5.0)

    override func didMoveToView(view: SKView) {

        self.physicsWorld.gravity = CGVectorMake(0, -0.04)
        self.physicsWorld.contactDelegate = self

        dot.physicsBody = SKPhysicsBody(rectangleOfSize: dot.frame.size)
        dot.physicsBody?.dynamic = true
        dot.physicsBody?.categoryBitMask = PhysicsCategory.Dot

        dot.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        addChild(dot)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        moveDotTo(touchLocation)

    }

    func moveDotTo(location:CGPoint){
        let actionMove = SKAction.moveTo(location, duration: 0.2)
        dot.runAction(SKAction.sequence([actionMove]))
    }
    
}

extension GameScene : SKPhysicsContactDelegate {

}