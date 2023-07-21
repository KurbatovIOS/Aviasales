@_private(sourceFile: "BadgeView.swift") import Aviasales
import SwiftUI
import SwiftUI

extension BadgeView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/SearchScreen/BadgeView.swift", line: 28)
        BadgeView()
    
#sourceLocation()
    }
}

extension BadgeView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/SearchScreen/BadgeView.swift", line: 12)
        ZStack {
            GeometryReader { geo in
                
            }
            RoundedRectangle(cornerRadius: __designTimeInteger("#27865.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: 100), style: .circular)
                .foregroundColor(.green)
            
            Text(__designTimeString("#27865.[1].[0].property.[0].[0].arg[0].value.[2].arg[0].value", fallback: "Самый дешёвый"))
                .foregroundColor(.white)
                .padding(__designTimeInteger("#27865.[1].[0].property.[0].[0].arg[0].value.[2].modifier[1].arg[0].value", fallback: 10))
        }
    
#sourceLocation()
    }
}

import struct Aviasales.BadgeView
import struct Aviasales.BadgeView_Previews
