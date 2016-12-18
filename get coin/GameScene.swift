//
//  GameScene.swift
//  get coin
//
//  Created by 三城聖 on 2016/06/26.
//  Copyright (c) 2016年 三城聖. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    //    ステージの値を共有
    open var stage: Int!
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //    ボールとラベルの設定
    let ball = SKShapeNode(circleOfRadius: 50)
    var wroteThing: SKShapeNode!
    
    var joint: SKPhysicsJointFixed!
    
//    ユーザーが書く動作
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)
            
            self.wroteThing = SKShapeNode(circleOfRadius: 50)
            
            wroteThing.fillColor = UIColor.black
            wroteThing.physicsBody?.isDynamic = true
            wroteThing.physicsBody?.allowsRotation = true
            wroteThing.physicsBody?.restitution = 1.0
            wroteThing.position = location
            wroteThing.isUserInteractionEnabled = true

            wroteThing.physicsBody = SKPhysicsBody(circleOfRadius: 50)
            self.joint = SKPhysicsJointFixed.joint(withBodyA: wroteThing.physicsBody!.self, bodyB: wroteThing.physicsBody!.self, anchor: CGPoint(x: wroteThing.frame.maxX, y: wroteThing.frame.midY))
//            self.addChild(wroteThing)
            self.physicsWorld.add(joint)
        }
    }
    
    //ユーザーがドラッグしている時にする処理
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       //self.addChild(wroteThing)を繰り返す
        for touch in touches {
            let location = touch.location(in: self)
            
            self.wroteThing = SKShapeNode(circleOfRadius: 50)
            
            wroteThing.fillColor = UIColor.black
            wroteThing.physicsBody?.isDynamic = true
            wroteThing.physicsBody?.allowsRotation = true
            wroteThing.physicsBody?.restitution = 1.0
            wroteThing.position = location
            wroteThing.isUserInteractionEnabled = true
            
            wroteThing.physicsBody = SKPhysicsBody(circleOfRadius: 50)
            
            self.joint = SKPhysicsJointFixed.joint(withBodyA: wroteThing.physicsBody!, bodyB: wroteThing.physicsBody!, anchor: CGPoint(x: wroteThing.frame.maxX, y: wroteThing.frame.midY))
//            self.addChild(wroteThing)
            self.physicsWorld.add(joint)
            
        }
    }
    
    //ユーザーが画面から指を離した時にする処理
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //重力、その他をwroteThingに付与する
        wroteThing.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        self.joint = SKPhysicsJointFixed.joint(withBodyA: wroteThing.physicsBody!.self, bodyB: wroteThing.physicsBody!.self, anchor: CGPoint(x: wroteThing.frame.maxX, y: wroteThing.frame.midY))
        self.addChild(wroteThing)
        self.physicsWorld.add(joint)
    }
    
    //    ノードの初期化
    override func didMove(to view: SKView) {
        self.stage = appDelegate.numGamenseni
        self.hantei(sentaku:stage)
        
        //エミッターを追加
        if let myEmitter = SKEffectNode(fileNamed: "MyParticle.sks") {
            ball.addChild(myEmitter)
        }
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        self.physicsBody?.restitution = 1.0
        
        self.backgroundColor = UIColor.cyan
        
        ball.physicsBody?.isDynamic = true
        
        ball.physicsBody?.allowsRotation = true
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 50)

        self.wroteThing = SKShapeNode(circleOfRadius: 50)
        
        wroteThing.fillColor = UIColor.black
        wroteThing.physicsBody?.isDynamic = true
        wroteThing.physicsBody?.allowsRotation = true
        wroteThing.physicsBody?.restitution = 1.0
        wroteThing.isUserInteractionEnabled = true
        
        wroteThing.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        
        
    }
    //    ボタンによるコース分けの宣言
    func hantei(sentaku:Int) {
        
        switch sentaku {
            
        case 1: ball.fillColor = UIColor.yellow
        ball.position = CGPoint(x: 320, y: 568)
        self.addChild(ball)
            
        case 2: ball.fillColor = UIColor.yellow
        ball.position = CGPoint(x: 320, y: 300)
        self.addChild(ball)
            
        default: ball.fillColor = UIColor.yellow
        ball.position = CGPoint(x: 320, y: 568)
        self.addChild(ball)
        }
    }
}


