//
//  GenericTabBarViewController.swift
//  BetaLabs
//
//  Created by Jorge Raul Ovalle Zuleta on 6/20/16.
//  Copyright © 2016 betalabs. All rights reserved.
//

import UIKit

class GenericTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.translucent     = false
        self.tabBar.tintColor       = UIColor.whiteColor()
        self.tabBar.barTintColor    = UIColor(red:0.35, green:0.31, blue:0.38, alpha:1.00)
        self.tabBar.itemPositioning = .Centered
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

class TabBarItem: UITabBarItem {
    
    override var title: String? {didSet{ if title != nil { title = nil }; return }}
    
    override init() {
        super.init()
        self.title = ""
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.title = nil
        self.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
    }
    
}
