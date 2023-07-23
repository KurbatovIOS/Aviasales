//
//  SearchResultView.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 23.07.2023.
//

import SwiftUI

struct SearchResultView: View {
    
    private let model: SearchViewModel
    private let result: SearchResult
    
    init(model: SearchViewModel, result: SearchResult) {
        self.model = model
        self.result = result
    }
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
                .ignoresSafeArea()
            VStack {
                Text("\(result.origin.name) — \(result.destination.name)")
                    .font(.system(size: 15, weight: .semibold))
                    .accessibilityLabel("cityHeadline")
                
                Text("\(model.getMonth(date: result.results.first?.arrivalDateTime ?? "")) \(result.passengersCount) чел")
                    .foregroundColor(.gray)
                    .font(.system(size: 11))
                    .accessibilityLabel("flightDate")
                
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(result.results) { flight in
                            NavigationLink {
                                FlightDetailsView(model: model, searchResult: result, flightToDisplay: flight)
                            } label: {
                                SearchResultCell(model: model, searchResult: result, flightToDisplay: flight)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 26)
                }
                .accessibilityLabel("searchScroll")
                .navigationTitle("Все билеты")
                .navigationBarHidden(true)
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        let model = SearchViewModel(apiService: APIService(), formatterService: FormatterService())
        let result = Result(id: UUID().uuidString, departureDateTime: "20:00", arrivalDateTime: "22:30", price: Price(currency: "RUB", value: 130), airline: "Аэрофлот", availableTicketsCount: 1)
        let searchResult = SearchResult(passengersCount: 1, origin: City(iata: "MOW", name: "Москва"), destination: City(iata: "LED", name: "Санкт-Петербург"), results: [result])
        
        SearchResultView(model: model, result: searchResult)
    }
}
