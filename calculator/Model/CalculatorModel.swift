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
    case porcentual
}

    /// A class for storing all the data needed for the app to work
    ///
    /// All the information that need to be store in orther for the app to work, adding numbers on the screen or performing operations, are stored on a variable of the type CalculatorModel.
    ///
    /// Parameters:
    ///  - total: The result of any mathematical operation (selected by the user)
    ///  - numberA: First number number typed by the user.
    ///  - numberB: Second number typed by the user.
    ///  - operation: Stores the operation selected by the user
    ///  - completeOperationText: Used to show to the user the complete operation, with all numbers and the operator.
    ///
class CalculatorModel {
    var id = UUID()
    var total: Double?
    var numberB: Double
    var numberA: Double
    var operation: OperationOptions?
    var compelteOperationText: String
    
    init() {
        numberB = 0
        numberA = 0
        compelteOperationText = ""
    }
    
        /// Take number A and number B, an then calculate the result of the operation selected
        ///
        /// - Parameter operationToDo: the operation selectd by the user
    class func calculateOperation(operationToDo: OperationOptions, numberA: Double, numberB: Double) -> Double {
        var total: Double = 0
        
        switch operationToDo {
            case .plus:
                print("Plus")
                total = numberA + numberB
                return total
            case .subtract:
                print("Subtract \(numberA) - \(numberB)")
                total = numberA - numberB
                return total
            case .multiply:
                print("Multiply")
                total = numberA * numberB
                return total
            case .divider:
                print("Divider")
                total = numberA / numberB
                return total
            case .porcentual:
                print("Porcentual")
                total = numberA / 100
                total = numberB / 100
                return total
        }
        
//        if operationToDo == OperationOptions.plus {
//            print("Plus")
//            total = numberA + numberB
//        } else if operationToDo == OperationOptions.subtract {
//            print("Subtract \(numberA) - \(numberB)")
//            total = numberA - numberB
//
//        } else if operationToDo == OperationOptions.multiply {
//            print("Multiply")
//            total = numberA * numberB
//        } else if operationToDo == OperationOptions.divider {
//            print("Divider")
//            total = numberA / numberB
//        } else if operationToDo == OperationOptions.porcentual {
//            print("Porcentual")
//            total = numberA / 100
//            total = numberB / 100
//        }
//        return total
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
    func moveNomberFromAToB() {
        numberB = numberA
        print("moveNomberFromAToB - NumberA:\(numberA) to NumberB:\(numberB)")
        
        numberA = 0
        print("moveNomberFromAToB - New numberB: \(numberA)")
    }
}
