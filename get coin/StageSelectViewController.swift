//
//  StageSelectViewController.swift
//  get coin
//
//  Created by 三城聖 on 2016/07/10.
//  Copyright © 2016年 三城聖. All rights reserved.
//

import UIKit

class StageSelectViewController: UIViewController {
    
    var stageNum: Int!
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(){
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    @IBAction func stageSelect(sender: UIButton){
        print(sender.tag)
        stageNum = sender.tag
        appDelegate.numGamenseni = self.stageNum
        self.performSegueToGameScene()
    }
    
   func performSegueToGameScene() {
       performSegueWithIdentifier("toGameScene", sender: nil)
   }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toGameScene") {
            let GameView = segue.destinationViewController as! GameViewController
//            GameView.stage = self.stageNum
        }
    }


    
}
