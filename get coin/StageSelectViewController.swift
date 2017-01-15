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
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)

    }
    
    func performSegueToGameScene() {
        performSegue(withIdentifier: "toGameScene", sender: nil)
    }
    
    @IBAction func stageSelect(sender: UIButton){
        print(sender.tag)
        stageNum = sender.tag
        self.performSegueToGameScene()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toGameScene") {
            let GameView = segue.destination as! GameViewController
            // GameViewControllerのstageにstageを代入
            GameView.stage = self.stageNum
            
        }
    }


    
}
