@_private(sourceFile: "SearchResultList.swift") import Aviasales
import SwiftUI
import SwiftUI

extension SearchResultList_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/SearchScreen/SearchResultList.swift", line: 75)
        SearchResultList(model: SearchViewModel(apiService: APIService(), formatterService: Fo))
    
#sourceLocation()
    }
}

extension SearchResultList {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/SearchScreen/SearchResultList.swift", line: 16)
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
                                    .padding(.bottom, __designTimeInteger("#8245.[1].[2].property.[0].[0].arg[0].value.[0].[3].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].modifier[0].arg[1].value", fallback: 10))
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
        //            List(model.searchResult?.results ?? []) { flight in
        //                NavigationLink {
        //                    Text("\(flight.available_tickets_count)")
        //                } label: {
        //                    SearchResultView(flightToDisplay: flight)
        //                }
        //            }
    
#sourceLocation()
    }
}

import struct Aviasales.SearchResultList
import struct Aviasales.SearchResultList_Previews
