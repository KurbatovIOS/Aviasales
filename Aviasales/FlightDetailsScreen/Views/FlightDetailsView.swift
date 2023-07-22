//
//  FlightDetailsView.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import SwiftUI

struct FlightDetailsView: View {
    
    private let model: SearchViewModel
    private let searchResult: SearchResult
    private let flightToDisplay: Result
    
    init(model: SearchViewModel, searchResult: SearchResult, flightToDisplay: Result) {
        self.model = model
        self.searchResult = searchResult
        self.flightToDisplay = flightToDisplay
    }
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text()
                    Text("Лучшая цена")
                }
           
                Text("Москва ")
                
                Spacer()
                
                Button("Купить билет") {
                    print("купил")
                }
                .foregroundColor(.white)
                .background(Color(UIColor.orange))
                .cornerRadius(10)
            }
        }
        
    }
}

struct FlightDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let model = SearchViewModel(apiService: APIService(), formatterService: FormatterService())
        let searchResult = SearchResult(passengersCount: 1, origin: City(iata: "MOW", name: "Москва"), destination: City(iata: "LED", name: "Санкт-Петербург"), results: [])
        let result = Result(id: UUID().uuidString, departureDateTime: "20:00", arrivalDateTime: "22:30", price: Price(currency: "RUB", value: 130), airline: "Аэрофлот", availableTicketsCount: 1)
        
        FlightDetailsView(model: model, searchResult: searchResult, flightToDisplay: result)
    }
}
