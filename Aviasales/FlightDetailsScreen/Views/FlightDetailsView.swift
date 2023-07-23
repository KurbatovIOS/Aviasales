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
        
        // MARK: iOS 14 navigation bar style fix
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    var body: some View {
        ZStack {
            // MARK: Background color
            Color(UIColor.systemGray6)
                .ignoresSafeArea()
            VStack {
                VStack {
                    // MARK: Ticket price
                    Text("\(flightToDisplay.price.value) \(model.getCurrencySymbol(for: flightToDisplay.price.currency))")
                        .accessibilityIdentifier("price")
                        .font(.system(size: 34, weight: .bold))
                    
                    // MARK: Information if this is the cheapest option
                    if flightToDisplay.isCheapest {
                        Text("Лучшая цена за \(searchResult.passengersCount) чел")
                            .font(.system(size: 13))
                    }
                }
                .padding(.bottom, 32)
                
                LazyVStack(alignment: .leading) {
                    // MARK: Information about departure and arrival places
                    Text("\(searchResult.origin.name) — \(searchResult.destination.name)")
                        .accessibilityIdentifier("cities")
                        .font(.system(size: 17, weight: .bold))
                    
                    FlightDetailCell(model: model, searchResult: searchResult, flightToDisplay: flightToDisplay)
                        .accessibilityIdentifier("flightBadge")
                }
                .padding(.horizontal, 16)
                
                Spacer()
                
                Button("Купить билет за \(flightToDisplay.price.value) \(model.getCurrencySymbol(for: flightToDisplay.price.currency))") {
                    showAlert = true
                }
                .accessibilityIdentifier("buyButton")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color(red: 255/255, green: 111/255, blue: 50/255))
                .cornerRadius(10)
                .padding(.horizontal, 8)
            }
            .padding(.vertical, 20)
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
