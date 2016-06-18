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
    @IBOutlet weak var textField: UITextField!
    
    var fahrenheitValue: Double? {
        didSet{
            updatCelsiusValues()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue{
            return (value - 32) * (5/9)
        }else{
            return nil
        }
    }
    
    let numberFormartter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updatCelsiusValues(){
        if let value = celsiusValue{
            self.celsiusLabel.text = self.numberFormartter.stringFromNumber(value)
        }else{
            self.celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingText(textField: UITextField){
        if let text = textField.text, value = Double(text){
            self.fahrenheitValue = value
        }else{
            self.fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        self.textField.resignFirstResponder()
    }
}
