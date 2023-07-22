//
//  FlightDetailsView.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import SwiftUI

struct FlightDetailsView: View {
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("")
                    Text("")
                }
           
                Text("")
                
                Spacer()
                
                Button("Купить билет") {
                    print("купил")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color(UIColor.red))
                .cornerRadius(10)
            }
        }
        
    }
}

struct FlightDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailsView()
    }
}
