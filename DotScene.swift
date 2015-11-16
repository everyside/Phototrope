//
//  DotScene.swift
//  Phototrope
//
//  Created by Dani Pletter on 10/22/15.
//  Copyright (c) 2015 Everyside Innovations, LLC. All rights reserved.
//

import SpriteKit

class DotScene: SKScene {

    let dot = SKShapeNode(circleOfRadius: 10.0)

    override init(){
        super.init()
    }

    override init(size: CGSize) {
        super.init(size:size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToView(view: SKView) {

        let emitter = SKEmitterNode(fileNamed:"Particle.sks")!
        emitter.particleSize = dot.frame.size
        emitter.targetNode = self

        dot.alpha = 0
        dot.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        dot.addChild(emitter)

        addChild(dot)
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.touchesBegan(touches, withEvent:event)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        moveDotTo(touchLocation)
    }

    func moveDotTo(location:CGPoint){
        let actionMove = SKAction.moveTo(location, duration: 0)
        dot.runAction(actionMove)
    }
    
}