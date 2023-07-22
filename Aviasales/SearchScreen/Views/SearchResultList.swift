//
//  SearchResultList.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import SwiftUI

struct SearchResultList: View {
    
    @ObservedObject var model : SearchViewModel
    let navBarAppearence = UINavigationBarAppearance()
    
    var body: some View {
        NavigationView {
            switch model.state {
            case .unset:
                ProgressView()
            case .error:
                ProgressView()
            case .loading:
                ProgressView()
            case .loaded(let result):
                ScrollView {
                    LazyVStack {
                        ForEach(result.results) { flight in
                            NavigationLink {
                                FlightDetailsView()
                            } label: {
                                SearchResultView(model: model, searchResult: result, flightToDisplay: flight)
                                    .padding(.bottom, 10)
                            }
                        }
                    }
                    .background(Color(UIColor.systemGray6))
                    .padding()
                }
                .background(Color(UIColor.systemGray6))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("\(result.origin.name) — \(result.destination.name)")
                                .font(.headline)
                            
                            Text("\(result.passengersCount) чел")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            model.fetchFlights()
            navBarAppearence.configureWithOpaqueBackground()
            navBarAppearence.backgroundColor = .systemGray6
            UINavigationBar.appearance().standardAppearance = navBarAppearence
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearence
        })
    }
}

struct SearchResultList_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultList(model: SearchViewModel(apiService: APIService(), formatterService: FormatterService()))
    }
}
