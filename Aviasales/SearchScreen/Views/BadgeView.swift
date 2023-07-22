//
//  BadgeView.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import SwiftUI

struct BadgeView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100, style: .circular)
                .foregroundColor(.green)
            
            Text("Самый дешёвый")
                .foregroundColor(.white)
                .padding(10)
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
