//
//  ViewController.swift
//  calculator
//
//  Created by Felipe Ugarte on 05-04-22.
//

import UIKit

class MainViewController: UIViewController {
    
        // MARK: - IBOutlets
    
    @IBOutlet weak var totalLabel: TotalLabel!
    @IBOutlet weak var Operation1Label: OperatorLabel!
    
    
        // MARK: - Properties
    
    var calculator = CalculatorModel()
    
    
        // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Operation1Label.isHidden = true

    }
    
    
        // MARK: - Functions
    
        /// Update the number on screen in the main label
        /// - Parameter numberToAdd: This is the number that is going to show
    func addNumerOnScreen( numberToAdd: Double) {
        calculator.numberA = calculator.numberA * 10 + numberToAdd
        totalLabel.text = "\(calculator.numberA)"
        print("AddNumerOnScreen: \(calculator.numberA)")
    }
    
    func changeSign() {
            calculator.numberA = calculator.numberA * -1
            totalLabel.text = "\(calculator.numberA)"
    }
    
        /// Update the value on the Operation1 label with a representation of the numbers and operation to be calculated
    fileprivate func updateOperatioLabel() {
        Operation1Label.text = calculator.compelteOperationText
        Operation1Label.isHidden = false

    }

    
        // MARK: - IBActions - NumberButtons
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if let value = sender.titleLabel?.text, let valueAsDouble = Double(value) {
            addNumerOnScreen(numberToAdd: valueAsDouble)
        }
    }

    
        // MARK: - IBActions - Operations Buttons
    
    @IBAction func operationPressed(_ sender: UIButton) {
        if let value = sender.titleLabel?.text, let op = OperationOptions(rawValue: value) {
            calculator.operation = op
            calculator.compelteOperationText = "\(calculator.numberA) + "
            updateOperatioLabel()
            calculator.moveNomberFromAToB()
        }
    }
    
    @IBAction func percentageButton(_ sender: Any) {
        calculator.numberA = CalculatorModel.calculatePercentage(number: calculator.numberA)
        totalLabel.text = "\(calculator.numberA)"
    }
    @IBAction func changeSightButton(_ sender: Any) {
        changeSign()
        calculator.compelteOperationText = "\(calculator.numberA)"
        updateOperatioLabel()
    }
    @IBAction func eraceMemoryButton(_ sender: Any) {
        calculator.numberA = 0
        calculator.numberB = 0
        calculator.total = 0
        totalLabel.text = "\(calculator.numberA)"
        calculator.compelteOperationText = ""
        updateOperatioLabel()
        print("EraceMemoryButton: \(calculator.numberA)")
    }
    
    
        // MARK: - IBActions - Equal Button

    
    @IBAction func equalButton(_ sender: Any) {
        if let total = calculator.total {
            print("EqualButton A: \(calculator.numberA), B: \(calculator.numberB), Total: \(total)")
        }

        if let operation = calculator.operation {
            print("Calculate Operation: \(operation)")
            calculator.compelteOperationText = calculator.compelteOperationText + "\(calculator.numberA)"
            updateOperatioLabel()
            calculator.total = CalculatorModel.calculateOperation(operationToDo: operation, numberA: calculator.numberB, numberB: calculator.numberA)
            if let total = calculator.total {
                print("CaluclateOperation: \(total)")
                totalLabel.text = "\(total)"
//                calculator.numberA = total
                calculator.numberB = total
            }
        }
    }
}

