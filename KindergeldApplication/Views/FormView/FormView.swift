//
//  FormView.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI

struct FormView: View {
    
    @State var manTitle: String = ""
    @State var manFirstname: String = ""
    @State var manSurename: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    topStepBar
                    VStack(alignment: .leading) {
                        title
                        explanationText
                        subtitle
                        formTextFields
                    }
                    
                }
                .padding(.horizontal, 15)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    toolbarItem
                }
            }
        }
        
    }
}

extension FormView {
    var toolbarItem: some View {
        Button {
            print("Language Button tapped")
        } label: {
            LanguageButton()
        }
    }
    
    var topStepBar: some View {
        TopStepBarView(step: 1)
            .padding(.vertical, 8)
    }
    
    
    var title: some View {
        Text("Formuláre")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
    
    var explanationText: some View {
        Text("Pre žiadosť o Kindergeld potrebuješ vyplniť nasledovné dokumenty. Ak je niečo nezrozumteľné, tak klikni vpravo na Vysvetlivky \(Image(systemName: "questionmark.circle"))")
            .font(.title3)
    }
    var subtitle: some View {
        VStack {
            Text("Údaje žiadateľa")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.customRed)
            Text("Pozri vysvetlivky, kto môže žiadať o prídavky")
                .font(.caption2)
                .foregroundStyle(Color.label)
        }
        .padding(.vertical, 15)
    }
    
    var formTextFields: some View {
        VStack {
            CustomInput(placeholder: "Titul", text: $manTitle) {
                print("go")
            }
            }
        }
    }


#Preview {
    FormView()
}
