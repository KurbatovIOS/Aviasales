//
//  SearchResultList.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import SwiftUI

struct SearchResultList: View {
    
    @ObservedObject var model : SearchViewModel
    //let navBarAppearence = UINavigationBarAppearance()
    
    var body: some View {
        NavigationView {
            switch model.state {
            case .unset:
                ProgressView()
            case .error:
                LoadingErrorView(model: model)
            case .loading:
                ProgressView()
            case .loaded(let result):
                ZStack {
                    Color(UIColor.systemGray6)
                        .ignoresSafeArea()
                    VStack {
                        Text("\(result.origin.name) — \(result.destination.name)")
                            .font(.headline)
                        
                        Text("\(model.getMonth(date: result.results.first?.arrivalDateTime ?? "")) \(result.passengersCount) чел")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        
                        ScrollView {
                            LazyVStack {
                                ForEach(result.results) { flight in
                                    NavigationLink {
                                        FlightDetailsView(model: model, searchResult: result, flightToDisplay: flight)
                                    } label: {
                                        SearchResultView(model: model, searchResult: result, flightToDisplay: flight)
                                            .padding(.bottom, 10)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 12)
                            .padding(.top, 26)
                        }
                        .navigationTitle("Все билеты")
                        .navigationBarHidden(true)
                    }
                    
                    //                    .toolbar {
                    //                        ToolbarItem(placement: .principal) {
                    //                            VStack {
                    //                                Text("\(result.origin.name) — \(result.destination.name)")
                    //                                    .font(.headline)
                    //
                    //                                Text("\(result.passengersCount) чел")
                    //                                    .foregroundColor(.gray)
                    //                                    .font(.subheadline)
                    //                            }
                    //                        }
                    //                    }
                }
            }
        }
        .onAppear(perform: {
            model.fetchFlights()
//            navBarAppearence.configureWithOpaqueBackground()
//            navBarAppearence.backgroundColor = .systemGray6
//            UINavigationBar.appearance().standardAppearance = navBarAppearence
//            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearence
        })
    }
}

struct SearchResultList_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultList(model: SearchViewModel(apiService: APIService(), formatterService: FormatterService()))
    }
}
