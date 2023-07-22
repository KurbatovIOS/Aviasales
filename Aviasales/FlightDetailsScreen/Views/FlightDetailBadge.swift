//
//  FlightDetailBadge.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 22.07.2023.
//

import SwiftUI

struct FlightDetailBadge: View {
    
    private let model: SearchViewModel
    private let searchResult: SearchResult
    private let flightToDisplay: Result
    
    init(model: SearchViewModel, searchResult: SearchResult, flightToDisplay: Result) {
        self.model = model
        self.searchResult = searchResult
        self.flightToDisplay = flightToDisplay
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 12) {
                    Image(flightToDisplay.airline)
                        .resizable()
                        .frame(width: 32, height: 32)
                    
                    Text(flightToDisplay.airline)
                        .font(.system(size: 15, weight: .semibold))
                }
                
                FlightInfoView(cityName: searchResult.origin.name,
                               cityIata: searchResult.origin.iata,
                               time: model.formatTime(date: flightToDisplay.departureDateTime) ?? "",
                               date: model.formatDate(date: flightToDisplay.departureDateTime) ?? "")
                
                FlightInfoView(cityName: searchResult.destination.name,
                               cityIata: searchResult.destination.iata,
                               time: model.formatTime(date: flightToDisplay.arrivalDateTime) ?? "",
                               date: model.formatDate(date: flightToDisplay.arrivalDateTime) ?? "")
            }
            .padding(12)
        }
    }
}

struct FlightDetailBadge_Previews: PreviewProvider {
    static var previews: some View {
        let model = SearchViewModel(apiService: APIService(), formatterService: FormatterService())
        let searchResult = SearchResult(passengersCount: 1, origin: City(iata: "MOW", name: "Москва"), destination: City(iata: "LED", name: "Санкт-Петербург"), results: [])
        let result = Result(id: UUID().uuidString, departureDateTime: "20:00", arrivalDateTime: "22:30", price: Price(currency: "RUB", value: 130), airline: "Аэрофлот", availableTicketsCount: 1)
        
        FlightDetailBadge(model: model, searchResult: searchResult, flightToDisplay: result)
    }
}
