//
//  calculatorTests.swift
//  calculatorTests
//
//  Created by Felipe Ugarte on 05-04-22.
//

import XCTest
@testable import calculator

class calculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testOperatorCalculation() throws {
        XCTAssert(CalculatorModel.calculateOperation(operationToDo: .plus, numberA: 10, numberB: 2) == 12)
        XCTAssert(CalculatorModel.calculateOperation(operationToDo: .subtract, numberA: 10, numberB: 2) == 8)
        XCTAssert(CalculatorModel.calculateOperation(operationToDo: .multiply, numberA: 10, numberB: 2) == 20)
        XCTAssert(CalculatorModel.calculateOperation(operationToDo: .divider, numberA: 10, numberB: 2) == 5)
        XCTAssert(CalculatorModel.calculatePercentage(number: 5) == 0.05)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
