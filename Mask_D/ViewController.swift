//
//  ViewController.swift
//  Mask_D
//
//  Created by idea on 2018/8/20.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var img1: UIImageView!
    @IBOutlet var img2: UIImageView!
    lazy var img3: UIImageView = {
        let img3 = UIImageView()
        img3.contentMode = .scaleAspectFill
        img3.image = UIImage(named: "people")
        return img3
    }()
    @IBOutlet var v: UIView!{
        didSet{
            v.layer.cornerRadius = 5
            v.layer.masksToBounds = true
        }
    }
    @IBOutlet var lab1: UILabel!
    @IBOutlet var lab2: UILabel!
    var  makeLayer: CALayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addMashLayer()
    }
    
    func addMashLayer() {
        let img = #imageLiteral(resourceName: "mask_image")
        makeLayer = CALayer()
        makeLayer.frame = CGRect(origin: CGPoint.zero, size: img.size)
        
//        makeLayer.backgroundColor = UIColor.black.cgColor      //使用背景色
        makeLayer.contents = img.cgImage
        makeLayer.position = view.center
        img2.layer.mask = makeLayer
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touche in touches {
            CATransaction.setDisableActions(true)
            makeLayer.position = touche.location(in: self.view)
        }
    }
}

