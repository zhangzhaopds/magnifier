//
//  ViewController.swift
//  Magnifier_demo
//
//  Created by 张昭 on 09/11/2017.
//  Copyright © 2017 tongxingpay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mBgImageView: UIImageView!
    var mMagnifier: Magnifier?
    var mTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        mTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(addView), userInfo: nil, repeats: false)
        if mMagnifier == nil {
            mMagnifier = Magnifier.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
            mMagnifier?.mMagnifierView = view
        }
        mMagnifier?.mMagnifiedPoint = touches.first?.location(in: view)
        mMagnifier?.setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        mMagnifier?.mMagnifiedPoint = touches.first?.location(in: view)
        mMagnifier?.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        mTimer?.invalidate()
        mTimer = nil
        mMagnifier = nil
        mMagnifier?.mMagnifierView = nil
    }
    
    @objc func addView() {
        mMagnifier?.makeKeyAndVisible()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

