@_private(sourceFile: "FlightDetailsView.swift") import Aviasales
import SwiftUI
import SwiftUI

extension FlightDetailsView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/FlightDetailsScreen/FlightDetailsView.swift", line: 39)
        FlightDetailsView()
    
#sourceLocation()
    }
}

extension FlightDetailsView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/artemk/Developer/SwiftUI/Aviasales/Aviasales/Views/FlightDetailsScreen/FlightDetailsView.swift", line: 12)
        ZStack {
            Color(UIColor.systemGray6)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text(__designTimeString("#5768.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: ""))
                    Text(__designTimeString("#5768.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: ""))
                }
           
                Text(__designTimeString("#5768.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value", fallback: ""))
                
                Spacer()
                
                Button(__designTimeString("#5768.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[3].arg[0].value", fallback: "Купить билет")) {
                    print(__designTimeString("#5768.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[3].arg[1].value.[0].arg[0].value", fallback: "купил"))
                }
                .padding()
                .foregroundColor(.white)
                .background(Color(UIColor.orange))
                .cornerRadius(__designTimeInteger("#5768.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[3].modifier[3].arg[0].value", fallback: 10))
            }
        }
    
#sourceLocation()
    }
}

import struct Aviasales.FlightDetailsView
import struct Aviasales.FlightDetailsView_Previews
