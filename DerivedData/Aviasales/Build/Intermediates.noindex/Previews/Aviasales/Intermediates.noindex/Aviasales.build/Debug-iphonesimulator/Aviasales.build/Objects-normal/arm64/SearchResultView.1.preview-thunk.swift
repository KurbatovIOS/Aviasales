@_private(sourceFile: "SearchResultView.swift") import Aviasales
import SwiftUI
import SwiftUI

extension SearchResultView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/SearchScreen/SearchResultView.swift", line: 62)
        SearchResultView(model: SearchViewModel(apiService: APIService()), searchResult: SearchResult(passengersCount: __designTimeInteger("#10229.[2].[0].property.[0].[0].arg[1].value.arg[0].value", fallback: 1), origin: City(iata: __designTimeString("#10229.[2].[0].property.[0].[0].arg[1].value.arg[1].value.arg[0].value", fallback: "MOW"), name: __designTimeString("#10229.[2].[0].property.[0].[0].arg[1].value.arg[1].value.arg[1].value", fallback: "Москва")), destination: City(iata: __designTimeString("#10229.[2].[0].property.[0].[0].arg[1].value.arg[2].value.arg[0].value", fallback: "LED"), name: __designTimeString("#10229.[2].[0].property.[0].[0].arg[1].value.arg[2].value.arg[1].value", fallback: "Санкт-Петербург")), results: []), flightToDisplay: Result(id: UUID().uuidString, departureDateTime: __designTimeString("#10229.[2].[0].property.[0].[0].arg[2].value.arg[1].value", fallback: "20:00"), arrivalDateTime: __designTimeString("#10229.[2].[0].property.[0].[0].arg[2].value.arg[2].value", fallback: "22:30"), price: Price(currency: __designTimeString("#10229.[2].[0].property.[0].[0].arg[2].value.arg[3].value.arg[0].value", fallback: "RUB"), value: __designTimeInteger("#10229.[2].[0].property.[0].[0].arg[2].value.arg[3].value.arg[1].value", fallback: 130)), airline: __designTimeString("#10229.[2].[0].property.[0].[0].arg[2].value.arg[4].value", fallback: "Аэрофлот"), availableTicketsCount: __designTimeInteger("#10229.[2].[0].property.[0].[0].arg[2].value.arg[5].value", fallback: 1)))
    
#sourceLocation()
    }
}

extension SearchResultView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/SearchScreen/SearchResultView.swift", line: 23)
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(__designTimeInteger("#10229.[1].[4].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 10))
            
            VStack(alignment: .leading, spacing: __designTimeInteger("#10229.[1].[4].property.[0].[0].arg[0].value.[1].arg[1].value", fallback: 12)) {
                HStack {
                    Text("\(flightToDisplay.price.value) ₽")
                        .font(.system(size: __designTimeInteger("#10229.[1].[4].property.[0].[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 19), weight: .bold))
                        .foregroundColor(.blue)
                    Spacer()
                    Image(flightToDisplay.airline)
                        .resizable()
                        .frame(width: __designTimeInteger("#10229.[1].[4].property.[0].[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[2].modifier[1].arg[0].value", fallback: 26), height: __designTimeInteger("#10229.[1].[4].property.[0].[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[2].modifier[1].arg[1].value", fallback: 26))
                }
                if flightToDisplay.availableTicketsCount < 10 {
                    Text("Осталось \(flightToDisplay.availableTicketsCount) \(model.formatTicketCountMessage(ticketCount: flightToDisplay.availableTicketsCount)) по этой цене")
                        .foregroundColor(.red)
                        .font(.system(size: __designTimeInteger("#10229.[1].[4].property.[0].[0].arg[0].value.[1].arg[2].value.[1].[0].[0].modifier[1].arg[0].value.arg[0].value", fallback: 13)))
                }
                
                FlightInfoView(cityName: searchResult.origin.name,
                               cityIata: searchResult.origin.iata,
                               time: flightToDisplay.departureDateTime,
                               date: flightToDisplay.departureDateTime)
                
                FlightInfoView(cityName: searchResult.destination.name,
                               cityIata: searchResult.destination.iata,
                               time: flightToDisplay.arrivalDateTime,
                               date: flightToDisplay.arrivalDateTime)                
            }
            .foregroundColor(.black)
            .padding()
        }
    
#sourceLocation()
    }
}

import struct Aviasales.SearchResultView
import struct Aviasales.SearchResultView_Previews
