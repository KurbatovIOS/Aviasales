//
//  SearchViewModel.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    enum State {
        case unset
        case loading
        case error
        case loaded(SearchResult)
    }
    
    private let currencyList: [String:String] = [
        "RUB": "₽",
    ]
    
    @Published var state: State = .unset
    
    private let apiService: APIServiceProtocol
    private let formatterService: FormatterServiceProtocol
    
    init(apiService: APIServiceProtocol, formatterService: FormatterServiceProtocol) {
        self.apiService = apiService
        self.formatterService = formatterService
    }
    
    func fetchFlights() {
        state = .loading
        // MARK: Try to load flights information
        self.apiService.fetchFlights(from: CityToFetch.moscow, to: CityToFetch.spb) { [weak self] result in
            guard let result, let self else {
                DispatchQueue.main.async {
                    self?.state = .error
                }
                return
            }
            // MARK: Sort flights by ticket price in ascending order
            var sortedPrice = self.sortByPrice(flights: result.results)
            guard !sortedPrice.isEmpty else {
                DispatchQueue.main.async {
                    self.state = .error
                }
                return
            }
            // MARK: Mark first option as the cheapest
            sortedPrice[0].isCheapest = true
            let searchResult = SearchResult(passengersCount: result.passengersCount, origin: result.origin, destination: result.destination, results: sortedPrice)
            DispatchQueue.main.async {
                self.state = .loaded(searchResult)
            }
        }
    }
    
    func sortByPrice(flights: [Result]) -> [Result] {
        flights.sorted { flight1, flight2 in
            flight1.price.value < flight2.price.value
        }
    }
    
    func getCurrencySymbol(for givenCurrency: String) -> String {
        if let currencySymbol = currencyList[givenCurrency] {
            return currencySymbol
        }
        return ""
    }
    
    // MARK: Formatters
    func formatTicketCountMessage(ticketCount: Int) -> String {
        formatterService.formatTicketCountMessage(ticketCount: ticketCount)
    }
    
    func formatDate(date: String) -> String {
        formatterService.formatFlightDate(date: date)
    }
    
    func formatTime(date: String) -> String {
        formatterService.formatTime(date: date)
    }
    
    func getMonth(date: String) -> String {
        formatterService.getMonth(date: date)
    }
}
