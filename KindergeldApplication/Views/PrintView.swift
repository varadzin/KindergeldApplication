//
//  PrintView.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI

struct PrintView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Pre žiadosť o Kindergeld potrebuješ nasledovné dokumenty:")
                Text("1. Hlavná žiadosť o prídavky")
                    .padding(.vertical, 20)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Text("Antrag auf Kindergeld KG 1-cz")
                    .font(.caption2)
                Spacer()
            }
            .navigationTitle("Hotové dokumenty")
        }
    }
}

struct PrintView_Previews: PreviewProvider {
    static var previews: some View {
        PrintView()
    }
}
