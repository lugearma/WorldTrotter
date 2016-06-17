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
        let firstFrame = CGRect(x: 120, y: 240, width: 100, height: 150)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(firstView)
    }

}

