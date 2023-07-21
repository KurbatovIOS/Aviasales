@_private(sourceFile: "SearchResultList.swift") import Aviasales
import SwiftUI
import SwiftUI

extension SearchResultList_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/SearchScreen/SearchResultList.swift", line: 31)
        __designTimeSelection(SearchResultList()
            .environmentObject(__designTimeSelection(SearchViewModel(apiService: __designTimeSelection(APIService(), "#11091.[2].[0].property.[0].[0].modifier[0].arg[0].value.arg[0].value")), "#11091.[2].[0].property.[0].[0].modifier[0].arg[0].value")), "#11091.[2].[0].property.[0].[0]")
    
#sourceLocation()
    }
}

extension SearchResultList {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/SearchScreen/SearchResultList.swift", line: 15)
        __designTimeSelection(NavigationView {
            __designTimeSelection(List(model.searchResult?.results ?? []) { flight in
                __designTimeSelection(NavigationLink {
                    __designTimeSelection(Text("\(__designTimeSelection(flight.available_tickets_count, "#11091.[1].[1].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[0].value.[0].arg[0].value.[1].value.arg[0].value"))"), "#11091.[1].[1].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[0].value.[0]")
                } label: {
                    __designTimeSelection(Text(__designTimeSelection(flight.airline, "#11091.[1].[1].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[0].value")), "#11091.[1].[1].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0]")
                }, "#11091.[1].[1].property.[0].[0].arg[0].value.[0].arg[1].value.[0]")
            }
            .navigationTitle(__designTimeString("#11091.[1].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: "Москва"))
            .navigationBarTitleDisplayMode(.inline), "#11091.[1].[1].property.[0].[0].arg[0].value.[0]")
        }, "#11091.[1].[1].property.[0].[0]")
    
#sourceLocation()
    }
}

import struct Aviasales.SearchResultList
import struct Aviasales.SearchResultList_Previews
