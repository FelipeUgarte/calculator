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
    @IBOutlet weak var Operation2Label: OperatorLabel!
    @IBOutlet weak var Operation3Label: OperatorLabel!
    @IBOutlet weak var Operation4Label: OperatorLabel!
    
    
        // MARK: - Properties
    
    var calculator = CalculatorModel()
    var useOperator = false
    
        // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Operation1Label.isHidden = true
        Operation2Label.isHidden = true
        Operation3Label.isHidden = true
        Operation4Label.isHidden = true
        
            // Do any additional setup after loading the view.
    }
    
    
        // MARK: - Functions
    
    func updateTotal() {
        guard useOperator else {
            totalLabel.text = "\(calculator.numberA)"
            return
        }
        totalLabel.text = "\(calculator.numberB)"
    }
    
    func addNumerOnScreen( numberToAdd: Double) {
        if useOperator == true {
            print("calculator.numberImput=\(calculator.numberA) and calculator.total= \(calculator.total ?? 0)")
            calculator.numberB = calculator.numberB * 10 + numberToAdd
        } else {
            calculator.numberA = calculator.numberA * 10 + numberToAdd
        }
        updateTotal()
    }
    
        // MARK: - IBActions
    
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
    
    @IBAction func equalButton(_ sender: Any) {
        if useOperator == true {
            calculator.total = calculator.numberA + calculator.numberB
            useOperator.toggle()
            if let total = calculator.total {
                totalLabel.text = "\(total)"
            }
            calculator.numberA = 0
            calculator.numberB = 0
        }

    }
    @IBAction func plusButton(_ sender: Any) {
        useOperator.toggle()
    }
    @IBAction func subtractButton(_ sender: Any) {
    }
    @IBAction func multiplyButton(_ sender: Any) {
    }
    @IBAction func divisionButton(_ sender: Any) {
    }
    @IBAction func percentageButton(_ sender: Any) {
    }
    @IBAction func changeSightButton(_ sender: Any) {
    }
    @IBAction func eraceMemoryButton(_ sender: Any) {
        calculator.numberA = 0
        calculator.numberB = 0
        calculator.total = 0
        updateTotal()
        
    }
    
}

