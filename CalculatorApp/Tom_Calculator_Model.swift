//
//  Tom_Calculator_Model.swift
//  CalculatorApp
//
//  Created by Tom Chambers on 2021-10-06.
//

import Foundation

class Tom_Calculator_Model {
    var firstNumber: Double?
    var secondNumber: Double?
    var operation: String?
    
    
    func updateNumber(newNumber: Double){
        if (firstNumber == nil) {
            firstNumber = newNumber
        } else if(operation == nil){
            firstNumber = newNumber
        } else { secondNumber = newNumber
            
        }
}
    // -> means return parameter
    func getResult() -> Double {
        var result: Double

        switch (operation) {
        case "+":
          result = firstNumber! + secondNumber!
        case "-":
          result = firstNumber! - secondNumber!
        case "X":
          result = firstNumber! * secondNumber!
        case "/":
          result = firstNumber! / secondNumber!
        default:
            result = 0.0
        }
        
        return result
    }
    func reset() {
        firstNumber = nil
        secondNumber = nil
        operation = nil
        
    }
}
