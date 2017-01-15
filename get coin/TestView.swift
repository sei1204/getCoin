
//  TestView.swift
//  get coin
//
//  Created by 三城聖 on 2017/01/15.
//  Copyright © 2017年 三城聖. All rights reserved.
//

import UIKit

class TestView: UIView {

    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //Drawing code
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x:160, y:50))
        // カスタムビュー上の座標(160, 50)に移動
        path.addLine(to: CGPoint(x:220, y:150))
        // (160, 50)から(220, 150)に線が引かれます
        path.addLine(to: CGPoint(x: 90, y: 150))
        // 次に(220, 150)から(90, 150)に線ができます
        path.close()
        // (90, 150)から(160, 50)へ最短距離(直線)で閉じます
        UIColor.green.setFill()
        UIColor.red.setStroke()
        path.lineWidth = 3.0
        
        path.fill() // ここで初めて内部の色が出現
        path.stroke() // これでアウトラインが描画される
    }
    

}
