//
//  ViewController.swift
//  ConcaveCornerSample
//
//  Created by see-you on 2016/05/10.
//  Copyright © 2016年 see-you. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let centerView = UIView(frame: CGRectMake(0, 0, 200, 200))
        centerView.center = self.view.center
        self.view.addSubview(centerView)
        
        let topRightView = UIView(frame: CGRectMake(0, 100, 100, 100))
        let topLeftView = UIView(frame: CGRectMake(100, 100, 100, 100))
        let bottomRightView = UIView(frame: CGRectMake(0, 0, 100, 100))
        let bottomLeftView = UIView(frame: CGRectMake(100, 0, 100, 100))
        
        //右上の角 - 青色ビュー
        topRightView.backgroundColor = UIColor.blueColor()
        topRightView.layer.mask = concaveCorners(topRightView, corners: .TopRight, cornerRadius: 50)
        
        //左上の角 - 赤色ビュー
        topLeftView.backgroundColor = UIColor.redColor()
        topLeftView.layer.mask = concaveCorners(topLeftView, corners: .TopLeft, cornerRadius: 50)
        
        //右下の角 - 黄色いビュー
        bottomRightView.backgroundColor = UIColor.yellowColor()
        bottomRightView.layer.mask = concaveCorners(bottomRightView, corners: .BottomRight, cornerRadius: 50)
        
        //左下の角 - 緑色ビュー
        bottomLeftView.backgroundColor = UIColor.greenColor()
        bottomLeftView.layer.mask = concaveCorners(bottomLeftView, corners: .BottomLeft, cornerRadius: 50)
        
        
        centerView.addSubview(topRightView)
        centerView.addSubview(topLeftView)
        centerView.addSubview(bottomRightView)
        centerView.addSubview(bottomLeftView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

