//
//  ProjectTests.swift
//  ProjectTests
//
//  Created by Ramy Hanafi on 3/17/21.
//

import XCTest
@testable import Project

class ProjectTests: XCTestCase {
    let theFoodPurchaseModel = FoodPurchasedModel()
    let theWeightModel = WeightEntryModel()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testAddPurchase(){
        let prevCount = theFoodPurchaseModel.getNumOfItems()
        theFoodPurchaseModel.addPurchase(storeName: "", purchaseType: "Groceries")
        let newCount = theFoodPurchaseModel.getNumOfItems()
        XCTAssert(prevCount != newCount, "Both counts are the same!")
    }
    
    func testAddWeightEntry(){
        let prevCount = theWeightModel.getNumOfItems()
        let testNum = Float(100.0)
        let testDate = Date()
        theWeightModel.addEntry(enteredWeight: testNum, theDate: testDate)
        let newCount = theWeightModel.getNumOfItems()
        XCTAssert(prevCount != newCount, "Both counts are the same!")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
