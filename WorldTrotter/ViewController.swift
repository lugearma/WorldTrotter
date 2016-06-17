//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Luis Arias on 17/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstFrame = CGRect(x: 120, y: 240, width: 100, height: 150)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(firstView)
        
        let secondFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let secondView = UIView(frame: secondFrame)
        secondView.backgroundColor = UIColor.brownColor()
        self.view.addSubview(secondView)
    }

}

