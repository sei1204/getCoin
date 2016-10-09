//
//  GameScene.swift
//  get coin
//
//  Created by 三城聖 on 2016/06/26.
//  Copyright (c) 2016年 三城聖. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var stage: Int!
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    let scoreLabel = SKLabelNode(fontNamed: "Papyrus")
    let ball = SKShapeNode(circleOfRadius: 50)
    
    override func didMoveToView(view: SKView) {
        self.stage = appDelegate.numGamenseni
        self.hantei(stage)
        
        if let myEmitter = SKEffectNode(fileNamed: "MyParticle.sks") {
            ball.addChild(myEmitter)
        }
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
        self.physicsBody?.restitution = 0.1
        
        self.backgroundColor = UIColor.cyanColor()
        
        ball.physicsBody?.dynamic = true
        
        ball.physicsBody?.allowsRotation = true
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 50)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func hantei(substitution:Int) {
        
    switch substitution {
    
        case 1: ball.fillColor = UIColor.yellowColor()
                ball.position = CGPoint(x: 320, y: 568)
                self.addChild(ball)
        
        case 2: ball.fillColor = UIColor.yellowColor()
                ball.position = CGPoint(x: 320, y: 300)
                self.addChild(ball)
       
       default: ball.fillColor = UIColor.yellowColor()
                ball.position = CGPoint(x: 320, y: 568)
                self.addChild(ball)
    }
  }
}


