//
//  GameViewController.swift
//  get coin
//
//  Created by 三城聖 on 2016/06/26.
//  Copyright (c) 2016年 三城聖. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    var stage: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //gamesceneをsceneに代入
        let scene = GameScene(size:CGSize(width: 640, height: 1136))
        scene.stage = self.stage
        let skView = self.view as! SKView
        scene.scaleMode = .aspectFit
        skView.presentScene(scene)
        //sceneのstageにstageを代入
        scene.stage = self.stage
        questionLabel.text = "コインを全部取れ！"
        self.view.backgroundColor = UIColor.cyan
        
    }

    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    
}
