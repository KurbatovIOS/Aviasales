//
//  LoadingErrorView.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 22.07.2023.
//

import SwiftUI

struct LoadingErrorView: View {
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
                .ignoresSafeArea()
            VStack {
                Text("Что-то пошло не так")
                Button {
                    print("Retry")
                } label: {
                    Text("Повторить")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct LoadingErrorView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingErrorView()
    }
}
