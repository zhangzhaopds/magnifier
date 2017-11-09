//
//  Magnifier.swift
//  Magnifier_demo
//
//  Created by 张昭 on 09/11/2017.
//  Copyright © 2017 tongxingpay. All rights reserved.
//

import UIKit

class Magnifier: UIWindow {

    var mMagnifierView: UIView?
    var mMagnifiedPoint: CGPoint? {
        didSet {
            center = CGPoint.init(x: (mMagnifiedPoint?.x)!, y: (mMagnifiedPoint?.y)! - 50)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 2
        
        windowLevel = UIWindowLevelAlert
        clipsToBounds = true
        backgroundColor = UIColor.clear
        contentMode = .redraw
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        context?.interpolationQuality = .high
        context?.fill(CGRect.init(x: 0, y: 0, width: (mMagnifiedPoint?.x)! * 0.01, height: (mMagnifiedPoint?.y)! * 0.01))
        context?.translateBy(x: (mMagnifiedPoint?.x)! * 0.1, y: (mMagnifiedPoint?.y)! * 0.1)
        context?.scaleBy(x: 5, y: 5)
        context?.translateBy(x: -(mMagnifiedPoint?.x)!, y: -(mMagnifiedPoint?.y)!)
        mMagnifierView?.layer.render(in: context!)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
