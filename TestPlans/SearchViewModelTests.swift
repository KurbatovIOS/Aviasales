//
//  SearchViewModelTests.swift
//  AviasalesUnitTests
//
//  Created by Kurbatov Artem on 23.07.2023.
//

import XCTest
@testable import Aviasales

final class SearchViewModelTests: XCTestCase {
    
    private var viewModel: SearchViewModel!
    private var apiService: APIServiceProtocolMock!
    private var formatterService: FormatterServiceProtocolMock!
    
    // Arrange
    override func setUp() {
        apiService = APIServiceProtocolMock()
        formatterService = FormatterServiceProtocolMock()
        viewModel = SearchViewModel(apiService: apiService, formatterService: formatterService)
    }
    
    override func tearDown() {
        viewModel = nil
        apiService = nil
        formatterService = nil
    }
    
    func testFetchFlights() throws {
        // Act
        viewModel.fetchFlights()
        
        // Assert
        XCTAssertTrue(apiService.invokedFetchFlights)
        XCTAssertEqual(apiService.invokedFetchFlightsCount, 1)
    }
    
    func testFormatTicketCountMessage() {
        // Arrange
        let ticketCount = 1
        
        // Act
        _ = viewModel.formatTicketCountMessage(ticketCount: ticketCount)
        
        // Assert
        XCTAssertTrue(formatterService.invokedFormatTicketCountMessage)
        XCTAssertEqual(formatterService.invokedFormatTicketCountMessageCount, 1)
        XCTAssertTrue( formatterService.invokedFormatTicketCountMessageParameters?.0 == ticketCount)
    }
    
    func testFormatFlightDate() {
        // Arrange
        let date = "2023-09-03 17:55"
        
        // Act
        _ = viewModel.formatDate(date: date)
        
        // Assert
        XCTAssertTrue(formatterService.invokedFormatFlightDate)
        XCTAssertEqual(formatterService.invokedFormatFlightDateCount, 1)
        XCTAssertTrue( formatterService.invokedFormatFlightDateParameters?.0 == date)
    }
    
    func testFormatTime() {
        // Arrange
        let date = "2023-09-03 17:55"
        
        // Act
        _ = viewModel.formatTime(date: date)
        
        // Assert
        XCTAssertTrue(formatterService.invokedFormatTime)
        XCTAssertEqual(formatterService.invokedFormatTimeCount, 1)
        XCTAssertTrue( formatterService.invokedFormatTimeParameters?.0 == date)
    }
    
    func testGetMonth() {
        // Arrange
        let date = "2023-09-03 17:55"
        
        // Act
        _ = viewModel.getMonth(date: date)
        
        // Assert
        XCTAssertTrue(formatterService.invokedGetMonth)
        XCTAssertEqual(formatterService.invokedGetMonthCount, 1)
        XCTAssertTrue( formatterService.invokedGetMonthParameters?.0 == date)
    }
}
