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
            ScrollView {
           Text("Pre žiadosť o Kindergeld potrebuješ dokumenty:")
                        .padding(.horizontal, 10)
                        .padding(.top, 30)
                        .frame(idealWidth: 300)
                    VStack {
                        titleAndSubtitle(title: "1. Hlavná žiadosť o prídavky", subtitle: "Antrag auf Kindergeld KG 1-cz")
                        documentImage()
                        buttons(documentID: 1)
                        Spacer(minLength: 30)
                    }
                 .padding(.horizontal, 10)
                    .padding(.vertical, 20)
                    .background(Color.systemGray6)
                    
                VStack(alignment: .leading) {
                        titleAndSubtitle(title: "2.Príloha Dieťa", subtitle: "Anlage Kind zum Kindergeldantrag (KG 1-cz Anlage Kind) ")
                        documentImage()
                        buttons(documentID: 2)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 20)
                    
                VStack(alignment: .leading) {
                        titleAndSubtitle(title: "3.Príloha Zahraničie", subtitle: "Anlage Ausland zum Antrag auf deutsches Kindergeld(KG 51-cz Ausland)")
                        documentImage()
                        buttons(documentID: 3)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    .background(Color.systemGray6)
                bigButtons()
                }
                
                .navigationTitle("Hotové dokumenty")
            }
        }
    }


extension PrintView {
    
    func titleAndSubtitle(title: String, subtitle: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .padding(.vertical, 10)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.customRed)
            Text(subtitle)
                .font(.caption2)
                .padding(.leading, 10)
        }
    }
    
    func documentImage() -> some View {
        HStack {
            Image(systemName: "doc.text.fill")
                .foregroundColor(Color.customRed)
                .font(.system(size: 50))
            Text("Vyplnene na 75%")
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
    }
    
    
    func buttons(documentID: Int) -> some View {
        HStack {
            documentButton(buttonImage: "magnifyingglass", buttonText: "prezrieť dokument", buttonType: .viewDocument(documentID))
            documentButton(buttonImage: "paperplane.fill", buttonText: "poslať dokument", buttonType: .sendDocument(documentID))
            
            documentButton(buttonImage: "printer.fill", buttonText: "tlačiť dokument", buttonType: .printDocument(documentID))
        }
    }
    
    func bigButtons() -> some View {
        VStack {
            RedButton(title: "Poslat vsetko spolu", buttonImage: "paperplane.fill")
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 15)
                .padding(.bottom, 8)
            RedButton(title: "Tlacit vsetko naraz", buttonImage: "printer.fill")
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 15)
        }
        .padding(.vertical, 20)
    }
}

#Preview {
    PrintView(activeButton: ActiveButton.none)
}
