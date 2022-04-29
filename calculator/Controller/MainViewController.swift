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
    
    @IBAction func numbe0Button(_ sender: Any) {
        addNumerOnScreen(numberToAdd: 0)
    }
    @IBAction func number1Button(_ sender: Any) {
        addNumerOnScreen(numberToAdd: 1)
    }
    @IBAction func number2Button(_ sender: Any) {
        addNumerOnScreen(numberToAdd: 2)
    }
    @IBAction func number3Button(_ sender: Any) {
        addNumerOnScreen(numberToAdd: 3)
    }
    @IBAction func number4Button(_ sender: Any) {
        addNumerOnScreen(numberToAdd: 4)
    }
    @IBAction func number5Button(_ sender: Any) {
        addNumerOnScreen(numberToAdd: 5)
    }
    @IBAction func number6Button(_ sender: Any) {
        addNumerOnScreen(numberToAdd: 6)
    }
    @IBAction func number7Button(_ sender: Any) {
        addNumerOnScreen(numberToAdd: 7)
    }
    @IBAction func number8Button(_ sender: Any) {
        addNumerOnScreen(numberToAdd: 8)
    }
    @IBAction func number9Button(_ sender: Any) {
        addNumerOnScreen(numberToAdd: 9)
    }
  
    
    
        // MARK: - IBActions - Operations Buttons
    @IBAction func plusButton(_ sender: Any) {
        calculator.operation = .plus
        calculator.compelteOperationText = "\(calculator.numberA) + "
        updateOperatioLabel()
        calculator.moveNomberFromAToB()
    }
    @IBAction func subtractButton(_ sender: Any) {
        calculator.operation = .subtract
        print("Subtract button pressed: \(calculator.operation!)")
        calculator.compelteOperationText = "\(calculator.numberA) - "
        updateOperatioLabel()
        calculator.moveNomberFromAToB()
    }
    @IBAction func multiplyButton(_ sender: Any) {
        calculator.operation = .multiply
        calculator.compelteOperationText = "\(calculator.numberA) X "
        updateOperatioLabel()
        calculator.moveNomberFromAToB()
    }
    @IBAction func divisionButton(_ sender: Any) {
        calculator.operation = .divider
        calculator.compelteOperationText = "\(calculator.numberA) / "
        updateOperatioLabel()
        calculator.moveNomberFromAToB()
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
                calculator.numberA = total
            }
        }
    }
}

