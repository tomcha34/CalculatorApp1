//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Tom Chambers on 2021-10-04.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Outlets
    
    @IBOutlet weak var numberDisplay: UITextField!
    var startNewNumber = true
    
    //MARK:- Other Variables
    var calculatorModel = Tom_Calculator_Model()
    
    
    //MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  //MARK:- Actions
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        
        
        let buttonText = sender.currentTitle!
        
        var currentValue = numberDisplay.text!
        
        switch (buttonText) {
        case "0", "1","2", "3", "4", "5", "6", "7", "8", "9", ".":
            if (startNewNumber) {
                if (buttonText == ".") {
                    currentValue = "0."
                }
            
                else{
                currentValue = buttonText
                }
                
            }
            else {
                
             if (buttonText == "." ) {
                if (currentValue.contains(".")) {
                    // Do Nothing
                } else {
                currentValue = currentValue + buttonText
                }
             } else {
                    currentValue = currentValue + buttonText
                }
                
             }
            startNewNumber = false
            //Putting a ! says we are certain it will be the expected data type, if wrong, app will crash.
            calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            
        case "+", "-", "X", "/":
            if (calculatorModel.secondNumber != nil) {
                
                currentValue = String(calculatorModel.getResult())
                calculatorModel.reset()
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            }
            calculatorModel.operation = buttonText
            startNewNumber = true
        
            
        case "=":
            if (calculatorModel.secondNumber == nil) {
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            }
            currentValue = String(calculatorModel.getResult())
            startNewNumber = true
            
        case "C":
            currentValue = "0"
            calculatorModel.reset()
            startNewNumber = true
            
        default:
            //do something
        print(buttonText)
            
        }
        numberDisplay.text = currentValue
    }
    

}

