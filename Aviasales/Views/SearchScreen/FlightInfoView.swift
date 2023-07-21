//
//  FlightInfoView.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 21.07.2023.
//

import SwiftUI

struct FlightInfoView: View {
    
    let cityName: String
    let cityIata: String
    let time: String
    let date: String
    
    var body: some View {
        VStack(spacing: 2) {
            HStack {
                Text(cityName)
                    .font(.system(size: 15, weight: .bold))
                Spacer()
                Text(time)
            }
            
            HStack {
                Text(cityIata)
                    .font(.system(size: 13))
                Spacer()
                Text(date)
            }
        }
    }
}

struct FlightInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FlightInfoView(cityName: "Москва", cityIata: "MOW", time: "20:00", date: "3 сен, пн")
    }
}
