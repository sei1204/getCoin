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
    var stage: Int!
    //    ボールとラベルの設定
    let ball = SKShapeNode(circleOfRadius: 50)
    
    var path: UIBezierPath!
    
//    ユーザーが書く動作
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        path = UIBezierPath()
    }
    
    //ユーザーがドラッグしている時にする処理
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touchPoint = touches.first?.location(in: self),
            let previousTouchPoint = touches.first?.previousLocation(in: self) else {
                
                return
        }
        path.move(to: previousTouchPoint)
        path.addLine(to: touchPoint)
        
    }
    
    
    //ユーザーが画面から指を離した時にする処理
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //重力、その他をwroteThingに付与する
        
        let wroteThing = SKShapeNode()
        wroteThing.path = path.cgPath
        wroteThing.lineWidth = CGFloat(5.0)
        wroteThing.fillColor = UIColor.black
        wroteThing.physicsBody = SKPhysicsBody(circleOfRadius: wroteThing.frame.width / 2)
        print(wroteThing.physicsBody == nil)
        wroteThing.physicsBody?.isDynamic = true
        wroteThing.physicsBody?.allowsRotation = true
        wroteThing.physicsBody?.restitution = 1.0
        wroteThing.isUserInteractionEnabled = true
        self.addChild(wroteThing)
    }
    
    //    ノードの初期化
    override func didMove(to view: SKView) {
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


