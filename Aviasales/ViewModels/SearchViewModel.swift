//
//  SearchViewModel.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var searchResult: SearchResult?
    
    private var apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
        fetchFlights()
    }
    
    private func fetchFlights() {
        self.apiService.fetchFlights(from: CityToFetch.moscow, to: CityToFetch.spb) { result in
            guard let result else {
                // TODO: Show alert with error
                return
            }
            DispatchQueue.main.async {
                self.searchResult = result
            }
        }
    }
    
}
