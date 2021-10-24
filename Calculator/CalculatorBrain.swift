//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType != nil {
            operand2String.append(String(digit))
            return operand2String
        } else {
            operand1String.append(String(digit))
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        
        guard let operand1Double = Double(operand1String),
            let operand2Double = Double(operand2String),
            operand1String != "",
            operand2String != "",
            operatorType != nil
            else { return nil }
        
        switch operatorType {
        case .addition:
            return ("\(operand1Double + operand2Double)")
        case .subtraction:
            return ("\(operand1Double - operand2Double)")
        case .multiplication:
            return ("\(operand1Double * operand2Double)")
        case .division:
            return ("\(operand1Double / operand2Double)")
        case .none:
            return "Error"
        }
    }
}

