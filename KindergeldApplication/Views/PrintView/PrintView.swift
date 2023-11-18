//
//  PrintView.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI

struct PrintView: View {
    
    @State var activeButton: ActiveButton = .none
    
    var body: some View {
        NavigationView {
            VStack {
           titleAndSubtitle()
                
                    HStack {
                        documentButton(buttonImage: "magnifyingglass", buttonText: "prezrieť dokument", buttonType: .viewDocument)
                        documentButton(buttonImage: "paperplane.fill", buttonText: "poslať dokument", buttonType: .sendDocument)
                        
                        documentButton(buttonImage: "printer.fill", buttonText: "tlačiť dokument", buttonType: .printDocument)
                        }
                    Spacer()
                }
                .padding(.horizontal, 10)
                .navigationTitle("Hotové dokumenty")
            }
            
          
        }
    }


extension PrintView {
    
    func titleAndSubtitle() -> some View {
        VStack(alignment: .leading) {
            Text("Pre žiadosť o Kindergeld potrebuješ dokumenty:")
                .padding(.horizontal, 10)
                .frame(idealWidth: 300)
      Text("1. Hlavná žiadosť o prídavky")
                    .padding(.vertical, 10)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Text("Antrag auf Kindergeld KG 1-cz")
                    .font(.caption2)
                    .padding(.leading, 10)
            
        }
    }
    
    func documentImage() -> some View {
        HStack {
            Image(systemName: "doc.text.fill")
                .foregroundColor(.red)
                .font(.system(size: 50))
            Text("Vyplnene na 75%")
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
    }
    
}

#Preview {
    PrintView(activeButton: ActiveButton.none)
}
