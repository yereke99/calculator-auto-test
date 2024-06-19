import XCTest

class CalculatorUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Launch the application
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Close the application
        app.terminate()
    }

    func testAddition() throws {
        // Tap the buttons to enter numbers and perform addition
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        // Check if the result label displays the correct sum
        let resultLabel = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultLabel.label, "3")
    }

    // Add more test methods for other scenarios
    // For example, negative test cases
    
    func testDivisionByZero() throws {
        // Tap the buttons to enter numbers and perform division by zero
        app.buttons["5"].tap()
        app.buttons["÷"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        // Check if the alert is displayed with the correct message
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.waitForExistence(timeout: 1))
        XCTAssertEqual(alert.staticTexts.firstMatch.label, "Error: Division by zero")
        alert.buttons["OK"].tap()
    }

}
