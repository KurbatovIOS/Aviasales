//
//  AviasalesUITests.swift
//  AviasalesUITests
//
//  Created by Kurbatov Artem on 23.07.2023.
//
import Foundation
import XCTest

final class AviasalesUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    // Arrange
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        app = nil
    }
    
    func testSearchScreenElementsExistence() {
        // Assert
        XCTAssertTrue(app.staticTexts["cityHeadline"].exists)
        XCTAssertTrue(app.staticTexts["flightDate"].exists)
        XCTAssertTrue(app.scrollViews["searchScroll"].exists)
    }
    
    func testFlightDetailsElementsExistence() {
        // Act
        _ =  app.scrollViews["searchScroll"].waitForExistence(timeout: 2)
        app.scrollViews["searchScroll"].otherElements.firstMatch.tap()
        // Assert
        XCTAssertTrue(app.staticTexts["price"].exists)
        XCTAssertTrue(app.staticTexts["cities"].exists)
        XCTAssertTrue(app.staticTexts["flightBadge"].exists)
        XCTAssertTrue(app.buttons["buyButton"].exists)
    }
}
