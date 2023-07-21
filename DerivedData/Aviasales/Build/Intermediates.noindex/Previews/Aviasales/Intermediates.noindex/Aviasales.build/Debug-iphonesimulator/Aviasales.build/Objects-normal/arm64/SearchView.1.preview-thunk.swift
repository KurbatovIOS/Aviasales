@_private(sourceFile: "SearchView.swift") import Aviasales
import SwiftUI
import SwiftUI

extension SearchView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/SearchScreen/SearchView.swift", line: 27)
        SearchView()
    
#sourceLocation()
    }
}

extension SearchView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/SearchScreen/SearchView.swift", line: 15)
        VStack {
            Image(systemName: __designTimeString("#10780.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "globe"))
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(__designTimeString("#10780.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "Hello, world!"))
        }
        .padding()
    
#sourceLocation()
    }
}

import struct Aviasales.SearchView
import struct Aviasales.SearchView_Previews
