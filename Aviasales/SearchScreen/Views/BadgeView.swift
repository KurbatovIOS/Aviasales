//
//  BadgeView.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import SwiftUI

struct BadgeView: View {
    var body: some View {
        Text("Самый дешёвый")
            .foregroundColor(.white)
            .font(.system(size: 13, weight: .bold))
            .padding(.vertical, 2)
            .padding(.horizontal, 8)
            .background( RoundedRectangle(cornerRadius: 100, style: .circular)
                .foregroundColor(.green))
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
