//
//  CalculatorModel.swift
//  calculator
//
//  Created by Felipe Ugarte on 06-04-22.
//

import Foundation

enum OperationOptions: Int {
    case plus
    case subtract
    case multiply
    case divider
    case changeSign
    case porcentual
}

class CalculatorModel {
    var id = UUID()
    var total: Double?
    var numberA: Double
    var numberB: Double
    var operation: OperationOptions?
    var compelteOperationText: String
    
    init() {
        numberA = 0
        numberB = 0
        compelteOperationText = ""
    }
    
        /// Take number A and number B, an then calculate the result of the operation selected
        ///
        /// - Parameter operationToDo: the operation selectd by the user
    class func calculateOperation(operationToDo: OperationOptions, numberA: Double, numberB: Double) -> Double {
        var total: Double = 0
        
        if operationToDo == OperationOptions.plus {
            print("Plus")
            total = numberA + numberB
        } else if operationToDo == OperationOptions.subtract {
            print("Subtract \(numberA) - \(numberB)")
            total = numberA - numberB
            
        } else if operationToDo == OperationOptions.multiply {
            print("Multiply")
            total = numberA * numberB
        } else if operationToDo == OperationOptions.divider {
            print("Divider")
            total = numberA / numberB
        } else if operationToDo == OperationOptions.porcentual {
            print("Porcentual")
            total = numberA / 100
            total = numberB / 100
        }
        return total
//        if let total = total {
//            print("CaluclateOperation: \(total)")
//            totalLabel.text = "\(total)"
//            numberA = total
//        }
    }
    
    class func calculatePercentage(number: Double) -> Double {
        number / 100
    }
    
        /// Copy the at the value of numberB to numberA
        ///
        /// ```Swift
        /// After the user finish typing a number and select
        /// an operation, the value stored on numberB
        /// is copied to the numberA.
        /// The variable numberB is set to 0
        /// ```
    func moveNomberFromBToA() {
        numberA = numberB
        print("moveNomberFromBToA - NumberB: \(numberB) to \(numberA)")
        
        numberB = 0
        print("moveNomberFromBToA - New numberB: \(numberB)")
    }
}
