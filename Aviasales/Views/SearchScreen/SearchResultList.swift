//
//  SearchResultList.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import SwiftUI

struct SearchResultList: View {
    
    @EnvironmentObject var model : SearchViewModel
    
    var body: some View {
        NavigationView {
            List(model.searchResult?.results ?? []) { flight in
                NavigationLink {
                    Text("\(flight.available_tickets_count)")
                } label: {
                    Text(flight.airline)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("\(model.searchResult?.origin.name ?? "") — \(model.searchResult?.destination.name ??  "")")
                            .font(.headline)
                        
                        Text("\(model.searchResult?.passengers_count ?? 0) чел")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

struct SearchResultList_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultList()
            .environmentObject(SearchViewModel(apiService: APIService()))
    }
}
