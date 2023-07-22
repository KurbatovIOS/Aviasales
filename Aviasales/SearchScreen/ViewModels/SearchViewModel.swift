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
    
    @Published var state: State = .unset
    
    private let apiService: APIService
    private let formatterService: FormatterService
    
    init(apiService: APIService, formatterService: FormatterService) {
        self.apiService = apiService
        self.formatterService = formatterService
    }
    
    func fetchFlights() {
        state = .loading
        self.apiService.fetchFlights(from: CityToFetch.moscow, to: CityToFetch.spb) { [weak self] result in
            guard let result else {
                // TODO: Show alert with error
                DispatchQueue.main.async {
                    self?.state = .error
                }
                return
            }
            var sortedPrice = result.results.sorted { flight1, flight2 in
                flight1.price.value < flight2.price.value
            }
            guard !sortedPrice.isEmpty else {
                DispatchQueue.main.async {
                    self?.state = .error
                }
                return
            }
            sortedPrice[0].isCheapest = true
            let searchResult = SearchResult(passengersCount: result.passengersCount, origin: result.origin, destination: result.destination, results: sortedPrice)
            DispatchQueue.main.async {
                self?.state = .loaded(searchResult)
            }
        }
    }
    
    func formatTicketCountMessage(ticketCount: Int) -> String {
        formatterService.formatTicketCountMessage(ticketCount: ticketCount)
    }
    
    func formatDate(date: String) -> String? {
        formatterService.formatFlightDate(date: date)
    }
    
    func formatTime(date: String) -> String? {
        formatterService.formatTime(date: date)
    }
    
    func getMonth(date: String) -> String? {
        formatterService.getMonth(date: date)
    }
}
