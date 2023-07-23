//
//  SearchResultCell.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import SwiftUI

struct SearchResultCell: View {
    
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
                .foregroundColor(Color(UIColor.systemBackground))
                .cornerRadius(10)
            
            if flightToDisplay.isCheapest {
                BadgeView()
                    .offset(x: 8, y: -10)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("\(flightToDisplay.price.value) \(model.getCurrencySymbol(for: flightToDisplay.price.currency))")
                        .font(.system(size: 19, weight: .bold))
                        .foregroundColor(.blue)
                    Spacer()
                    Image(flightToDisplay.airline)
                        .resizable()
                        .frame(width: 26, height: 26)
                }
                if flightToDisplay.availableTicketsCount < 10 {
                    Text("Осталось \(flightToDisplay.availableTicketsCount) \(model.formatTicketCountMessage(ticketCount: flightToDisplay.availableTicketsCount)) по этой цене")
                        .foregroundColor(.red)
                        .font(.system(size: 13))
                }
                
                FlightInfoView(cityName: searchResult.origin.name,
                               cityIata: searchResult.origin.iata,
                               time: model.formatTime(date: flightToDisplay.departureDateTime),
                               date: model.formatDate(date: flightToDisplay.departureDateTime))
                
                FlightInfoView(cityName: searchResult.destination.name,
                               cityIata: searchResult.destination.iata,
                               time: model.formatTime(date: flightToDisplay.arrivalDateTime),
                               date: model.formatDate(date: flightToDisplay.arrivalDateTime))
            }
            .foregroundColor(.primary)
            .padding()
        }
    }
}

struct SearchResultCell_Previews: PreviewProvider {
    static var previews: some View {
        let model = SearchViewModel(apiService: APIService(), formatterService: FormatterService())
        let searchResult = SearchResult(passengersCount: 1, origin: City(iata: "MOW", name: "Москва"), destination: City(iata: "LED", name: "Санкт-Петербург"), results: [])
        let result = Result(id: UUID().uuidString, departureDateTime: "20:00", arrivalDateTime: "22:30", price: Price(currency: "RUB", value: 130), airline: "Аэрофлот", availableTicketsCount: 1)
                    
        SearchResultCell(model: model, searchResult: searchResult, flightToDisplay: result)
    }
}
