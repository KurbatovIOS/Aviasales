//
//  FlightDetailsView.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import SwiftUI

struct FlightDetailsView: View {
    
    @State private var showAlert = false
    
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
                    Text("\(flightToDisplay.price.value) \(model.getCurrencySymbol(for: flightToDisplay.price.currency))")
                        .font(.system(size: 34, weight: .bold))
                    
                    if flightToDisplay.isCheapest {
                        Text("Лучшая цена за \(searchResult.passengersCount) чел")
                            .font(.system(size: 13))
                    }
                }
                .padding(.bottom, 32)
                
                LazyVStack(alignment: .leading) {
                    Text("\(searchResult.origin.name) — \(searchResult.destination.name)")
                        .font(.system(size: 17, weight: .bold))
                    
                    FlightDetailBadge(model: model, searchResult: searchResult, flightToDisplay: flightToDisplay)
                }
                .padding(.horizontal, 16)
                
                Spacer()
                
                Button("Купить билет за \(flightToDisplay.price.value) \(model.getCurrencySymbol(for: flightToDisplay.price.currency))") {
                    showAlert = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color(UIColor.orange))
                .cornerRadius(10)
                .padding(.horizontal, 8)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Билет куплен за \(flightToDisplay.price.value) \(model.getCurrencySymbol(for: flightToDisplay.price.currency))"), dismissButton: .default(Text("Отлично")))
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
