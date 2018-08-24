//
//  BViewController.swift
//  Mask_D
//
//  Created by idea on 2018/8/24.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    @IBOutlet var aimg: UIImageView!
    @IBOutlet var bimg: UIImageView!
//        {
//        didSet{
//            self.a.addSubview(bimg)
//        }
//    }
    var lay :CALayer = {
        let lay = CALayer()
        lay.frame = CGRect(origin: CGPoint.zero, size:CGSize(width: 200, height: 200) )
        lay.backgroundColor = UIColor.red.cgColor
        lay.cornerRadius = 20
        return lay
    }()
    lazy var a: UIView = {
        let a = UIView()
        a.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 200))
        a.center = self.view.center
        a.layer.cornerRadius = 50
        return a
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.prompt = "闪烁"
        self.view.addSubview(a)
        
//        lay .position = view.center
//        bimg.layer.mask = lay
        
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for T in touches {
//            每一个uiview都默认关联着一个CALayer，我们称这个layer为root layer
//            所有的非root layer都存在默认的隐私动画，隐式动画默认为1/4秒。
            
//            如果关闭默认的动画效果：可以通过动画的事务方法实现
//            CATransaction.setDisableActions(true)
            lay.position = T.location(in: view)
        }
    }


}
