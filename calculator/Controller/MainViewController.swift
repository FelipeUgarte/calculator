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
        calculator.numberB = calculator.numberB * 10 + numberToAdd
        totalLabel.text = "\(calculator.numberB)"
        print("AddNumerOnScreen: \(calculator.numberB)")
    }
    
    func changeSign() {
            calculator.numberB = calculator.numberB * -1
            totalLabel.text = "\(calculator.numberB)"
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
        calculator.compelteOperationText = "\(calculator.numberB) + "
        updateOperatioLabel()
        calculator.moveNomberFromBToA()
    }
    @IBAction func subtractButton(_ sender: Any) {
        calculator.operation = .subtract
        print("Subtract button pressed: \(calculator.operation!)")
        calculator.compelteOperationText = "\(calculator.numberB) - "
        updateOperatioLabel()
        calculator.moveNomberFromBToA()
    }
    @IBAction func multiplyButton(_ sender: Any) {
        calculator.operation = .multiply
        calculator.compelteOperationText = "\(calculator.numberB) X "
        updateOperatioLabel()
        calculator.moveNomberFromBToA()
    }
    @IBAction func divisionButton(_ sender: Any) {
        calculator.operation = .divider
        calculator.compelteOperationText = "\(calculator.numberB) / "
        updateOperatioLabel()
        calculator.moveNomberFromBToA()
    }
    @IBAction func percentageButton(_ sender: Any) {
        calculator.numberB = CalculatorModel.calculatePercentage(number: calculator.numberB)
        totalLabel.text = "\(calculator.numberB)"
    }
    @IBAction func changeSightButton(_ sender: Any) {
        changeSign()
        calculator.compelteOperationText = "\(calculator.numberB)"
        updateOperatioLabel()
    }
    @IBAction func eraceMemoryButton(_ sender: Any) {
        calculator.numberA = 0
        calculator.numberB = 0
        calculator.total = 0
        totalLabel.text = "\(calculator.numberB)"
        calculator.compelteOperationText = ""
        updateOperatioLabel()
        print("EraceMemoryButton: \(calculator.numberB)")
    }
    
    
        // MARK: - IBActions - Equal Button

    
    @IBAction func equalButton(_ sender: Any) {
        if let total = calculator.total {
            print("EqualButton A: \(calculator.numberA), B: \(calculator.numberB), Total: \(total)")
        }

        if let operation = calculator.operation {
            print("Calculate Operation: \(operation)")
            calculator.compelteOperationText = calculator.compelteOperationText + "\(calculator.numberB)"
            updateOperatioLabel()
            calculator.total = CalculatorModel.calculateOperation(operationToDo: operation, numberA: calculator.numberA, numberB: calculator.numberB)
            if let total = calculator.total {
                print("CaluclateOperation: \(total)")
                totalLabel.text = "\(total)"
                calculator.numberB = total
            }
        }
    }
}

