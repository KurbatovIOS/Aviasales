//
//  APIServiceMock.swift
//  AviasalesUnitTests
//
//  Created by Kurbatov Artem on 23.07.2023.
//

@testable import Aviasales

final class APIServiceProtocolMock: APIServiceProtocol {

    var invokedFetchFlights = false
    var invokedFetchFlightsCount = 0
    var invokedFetchFlightsParameters: (from: CityToFetch, to: CityToFetch)?
    var invokedFetchFlightsParametersList = [(from: CityToFetch, to: CityToFetch)]()
    var stubbedFetchFlightsComplitionResult: (SearchResult?, Void)?

    func fetchFlights(from: CityToFetch, to: CityToFetch, complition: @escaping (SearchResult?) -> Void) {
        invokedFetchFlights = true
        invokedFetchFlightsCount += 1
        invokedFetchFlightsParameters = (from, to)
        invokedFetchFlightsParametersList.append((from, to))
        if let result = stubbedFetchFlightsComplitionResult {
            complition(result.0)
        }
    }
}
