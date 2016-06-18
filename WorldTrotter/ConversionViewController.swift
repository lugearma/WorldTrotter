//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Luis Arias on 18/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController{
    
    @IBOutlet weak var celsiusLabel: UILabel!
    
    @IBAction func fahrenheitFieldEditingText(textField: UITextField){
        self.celsiusLabel.text = textField.text
    }
}
