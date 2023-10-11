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
                Text("Pre žiadosť o Kindergeld potrebuješ dokumenty:")
                    .padding(.horizontal, 10)
                    .frame(idealWidth: 300)
                VStack(alignment: .leading) {
                    Text("1. Hlavná žiadosť o prídavky")
                        .padding(.vertical, 10)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    Text("Antrag auf Kindergeld KG 1-cz")
                        .font(.caption2)
                        .padding(.leading, 10)
                    HStack {
                        Image(systemName: "doc.text.fill")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                        Text("Vyplnene na 75%")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    HStack {
                        docButton(buttonImage: "magnifyingglass", buttonText: "prezrieť dokument")
                        docButton(buttonImage: "paperplane.fill", buttonText: "poslať dokument")
                        
                        docButton(buttonImage: "printer.fill", buttonText: "tlačiť dokument")
                        
                        
                    }
                    Spacer(minLength: 200)
                }
                .padding(.horizontal, 10)
            }
            
            .navigationTitle("Hotové dokumenty")
        }
    }
}

extension PrintView {
    func docButton(buttonImage: String, buttonText: String) -> some View {
        Button {
            print("Btn tapped")
        } label: {
            VStack {
                Image(systemName: buttonImage)
                    .font(.largeTitle)
                    .padding(4)
                Text(buttonText)
                    .font(.caption)
                    .padding(.horizontal, 5)
            }
        }
        .frame(width: 100, height: 100)
       .foregroundColor(.systemGray)
        .background(Color.systemGray6)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 4)
        .padding(10)
    }
}












struct PrintView_Previews: PreviewProvider {
    static var previews: some View {
        PrintView()
    }
}
