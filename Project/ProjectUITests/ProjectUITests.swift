//
//  ProjectUITests.swift
//  ProjectUITests
//
//  Created by Ramy Hanafi on 3/17/21.
//

import XCTest

class ProjectUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testForAddingAndDeletingFoodItem() throws {
        let app = XCUIApplication()
        let tablesQuery = app.tables.cells
        let prevCount = tablesQuery.count
        app.navigationBars["Food Purchases"].buttons["Add"].tap()
        app.alerts["Enter store name"].scrollViews.otherElements.buttons["Groceries"].tap()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        XCUIApplication().navigationBars["Add Item"].buttons["Food Purchases"].tap()
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        let newCount = tablesQuery.count
        XCTAssert(prevCount == newCount, "The item was not deleted!")

    }
    
    func testAddingInPurchase() throws {
        let app = XCUIApplication()
        XCUIApplication().activate()
        app.navigationBars["Food Purchases"].buttons["Add"].tap()
        app.alerts["Enter store name"].scrollViews.otherElements.buttons["Groceries"].tap()
        
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        app.textFields["Enter item to search for..."].tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        
        let pKey = app/*@START_MENU_TOKEN@*/.keys["p"]/*[[".keyboards.keys[\"p\"]",".keys[\"p\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pKey.tap()
        pKey.tap()
        
        let lKey = app/*@START_MENU_TOKEN@*/.keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lKey.tap()
        
        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        app.textFields["Enter item cost:"].tap()
        
        let moreKey = app/*@START_MENU_TOKEN@*/.keys["numbers"]/*[[".keyboards",".keys[\"numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[1]]@END_MENU_TOKEN@*/
        moreKey.tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        app.buttons["Add Item"].staticTexts["Add Item"].tap()
        app.navigationBars["Add Item"].buttons["Info"].tap()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        XCTAssert(!app.tables.element(boundBy: 0).cells.element(boundBy: 0).exists, "The item was not found!")
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
