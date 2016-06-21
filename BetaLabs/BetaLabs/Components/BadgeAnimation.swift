//
//  BadgeAnimation.swift
//  BetaLabs
//
//  Created by Jorge Raul Ovalle Zuleta on 6/21/16.
//  Copyright © 2016 betalabs. All rights reserved.
//

import UIKit

protocol BadgeAlertDelegate{
    func didClose()
}

class BadgeAlert:UIView{
    private let anim = BadgeAnimation()
    var delegate:BadgeAlertDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let bg   = UIImageView(image: UIImage(named: "bgAlert.jpg"))
        bg.frame = self.frame
        self.addSubview(bg)
        anim.center = self.center
        self.addSubview(anim)
        self.alpha = 0
    }
    
    func showAlert(){
        UIView.animateWithDuration(0.3, animations: { 
            self.alpha = 1
        }) { (finished) in
            self.anim.startAnimating()
            NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(self.closeAlert), userInfo: nil, repeats: false)
        }
    }
    
    func closeAlert(){
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 0
        }) { (finished) in
            self.removeFromSuperview()
            self.delegate.didClose()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BadgeAnimation: UIImageView {
    init(){
        super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        self.animationRepeatCount = 1
        var imgs = [UIImage]()
        for i in 1...89{
            if i%2==0{
                imgs.append(UIImage(named: "insignia\(i)")!)
            }
            self.animationImages = imgs
        }
        self.animationDuration = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
