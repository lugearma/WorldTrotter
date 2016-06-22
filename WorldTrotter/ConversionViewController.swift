//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Luis Arias on 18/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate{
    
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
    
    //MARK: TextField delegate methods
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var newString: NSString!
        
        if let text = textField.text{
            newString = self.convertStringToNSString(string: string)
            
            for i in 0 ..< newString.length{
                let c = newString!.characterAtIndex(i)
                return self.isCharacter(c, text: text, stringToChange: string)
            }
        }
        return false
    }
    
    func convertStringToNSString(string s : String) -> NSString {
        return NSString(string: s)
    }
    
    func isNumber(text t: String, stringToChange stc: String) -> Bool {
        let existingTextHasDecimalSeparator = t.rangeOfString(".")
        let replacementTextHasDecimalSeparator = stc.rangeOfString(".")
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil{
            return false
        }else{
            return true
        }
    }
    
    func isCharacter(char: unichar, text t: String, stringToChange stc: String) -> Bool {
        let characterSet = NSCharacterSet.letterCharacterSet()
        
        if characterSet.characterIsMember(char) {
            return false
        } else {
            return self.isNumber(text: t, stringToChange: stc)
        }
    }
}












