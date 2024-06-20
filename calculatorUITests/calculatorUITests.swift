import XCTest

class CalculatorUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testAddition() throws {
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        let resultLabel = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultLabel.label, "3")
    }

    func testSubtraction() throws {
        app.buttons["5"].tap()
        app.buttons["-"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        
        let resultLabel = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultLabel.label, "2")
    }

    func testMultiplication() throws {
        app.buttons["3"].tap()
        app.buttons["*"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
        
        let resultLabel = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultLabel.label, "12")
    }

    func testDivision() throws {
        app.buttons["8"].tap()
        app.buttons["÷"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        let resultLabel = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultLabel.label, "4")
    }

    func testDivisionByZero() throws {
        app.buttons["5"].tap()
        app.buttons["÷"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.waitForExistence(timeout: 1))
        XCTAssertEqual(alert.staticTexts.firstMatch.label, "Error: Division by zero")
        alert.buttons["OK"].tap()
    }

    func testInvalidInput() throws {
        app.buttons["+"].tap()
        app.buttons["="].tap()
        
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.waitForExistence(timeout: 1))
        XCTAssertEqual(alert.staticTexts.firstMatch.label, "Error: Invalid input")
        alert.buttons["OK"].tap()
    }
}
