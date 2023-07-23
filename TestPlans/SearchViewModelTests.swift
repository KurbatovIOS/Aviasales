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
    
    func testSortByPrice() {
        // Arrange
        let flight1 = Result(id: "1", departureDateTime: "", arrivalDateTime: "", price: Price(currency: "RUB", value: 1000), airline: "", availableTicketsCount: 1)
        let flight2 = Result(id: "2", departureDateTime: "", arrivalDateTime: "", price: Price(currency: "RUB", value: 10), airline: "", availableTicketsCount: 1)
        let flight3 = Result(id: "3", departureDateTime: "", arrivalDateTime: "", price: Price(currency: "RUB", value: 100), airline: "", availableTicketsCount: 1)
        // Act
        let sorted = viewModel.sortByPrice(flights: [flight1, flight2, flight3])
        // Assert
        XCTAssertTrue(sorted[0].id == "2")
        XCTAssertTrue(sorted[1].id == "3")
        XCTAssertTrue(sorted[2].id == "1")
    }
    
    func testGetCurrencySymbol() {
        // Arrange
        let rightCurrency = "RUB"
        let expectedRightResult = "₽"
        let wrongCurrency = "RU"
        let expectedWrongResult = ""
        // Act
        let rightResult = viewModel.getCurrencySymbol(for: rightCurrency)
        let wrongResult = viewModel.getCurrencySymbol(for: wrongCurrency)
        // Assert
        XCTAssertEqual(rightResult, expectedRightResult)
        XCTAssertEqual(wrongResult, expectedWrongResult)
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
