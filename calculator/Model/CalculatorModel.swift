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
}

struct CalculatorModel {
    var id = UUID()
    var total: Double?
    var temp: Double
    var numberA: Double
    var numberB: Double
//    var operation: OperationOptions
    
    
    init() {
        numberA = 0
        numberB = 0
        temp = 0
//        operation =
    }
}
