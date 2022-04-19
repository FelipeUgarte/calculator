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
    
    func addNumerOnScreen( numberToAdd: Double) {
        calculator.numberB = calculator.numberB * 10 + numberToAdd
        totalLabel.text = "\(calculator.numberB)"
        print("AddNumerOnScreen: \(calculator.numberB)")
    }
    
    func calculateOperation(operationToDo: OperationOptions) {
        if operationToDo == OperationOptions.plus {
            print("Plus")
            calculator.total = calculator.numberA + calculator.numberB
        } else if operationToDo == OperationOptions.subtract {
            print("Subtract \(calculator.numberA) - \(calculator.numberB)")
            calculator.total = calculator.numberA - calculator.numberB
            
        } else if operationToDo == OperationOptions.multiply {
            print("Multiply")
            calculator.total = calculator.numberA * calculator.numberB
        } else if operationToDo == OperationOptions.divider {
            print("Divider")
            calculator.total = calculator.numberA / calculator.numberB
        } else if operationToDo == OperationOptions.porcentual {
            print("Porcentual")
            calculator.total = calculator.numberA / 100
            calculator.total = calculator.numberB / 100
        }
        if let total = calculator.total {
            print("CaluclateOperation: \(total)")
            totalLabel.text = "\(total)"
            calculator.numberA = total
        }
    }
    
    func calculatePercentage(operationToDo: OperationOptions) {
            calculator.numberB = calculator.numberB / 100
            totalLabel.text = "\(calculator.numberB)"
    }
    
    func changeSign() {
            calculator.numberB = calculator.numberB * -1
            totalLabel.text = "\(calculator.numberB)"
    }
    
    fileprivate func moveNomberFromBToA() {
        calculator.numberA = calculator.numberB
        print("moveNomberFromBToA - NumberB: \(calculator.numberB) to \(calculator.numberA)")

        calculator.numberB = 0
        print("moveNomberFromBToA - New numberB: \(calculator.numberB)")
    }
    
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
        moveNomberFromBToA()
    }
    @IBAction func subtractButton(_ sender: Any) {
        calculator.operation = .subtract
        print("Subtract button pressed: \(calculator.operation!)")
        moveNomberFromBToA()
    }
    @IBAction func multiplyButton(_ sender: Any) {
        calculator.operation = .multiply
        moveNomberFromBToA()
    }
    @IBAction func divisionButton(_ sender: Any) {
        calculator.operation = .divider
        moveNomberFromBToA()
    }
    @IBAction func percentageButton(_ sender: Any) {
        calculatePercentage(operationToDo: .porcentual)
    }
    @IBAction func changeSightButton(_ sender: Any) {
        changeSign()
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
            calculateOperation(operationToDo: operation)
        }
    }
}

