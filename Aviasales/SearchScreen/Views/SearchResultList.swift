//
//  SearchResultList.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import SwiftUI

struct SearchResultList: View {
    
    @ObservedObject var model : SearchViewModel
    
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
                SearchResultView(model: model, result: result)
            }
        }
        .onAppear(perform: {
            model.fetchFlights()
        })
    }
}

struct SearchResultList_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultList(model: SearchViewModel(apiService: APIService(), formatterService: FormatterService()))
    }
}
