//
//  FormView4.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 03.12.23.
//

import SwiftUI

struct FormView4: View {
    
    @ObservedObject var viewModel: FormViewModel4
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            topStepBar
            VStack (alignment: .leading) {
                title
                explanationText
                subtitle
                publicService
                Spacer()
                Spacer()
                BackButton { dismiss() }
                NextButton(destination: FormView4(viewModel: FormViewModel4())) {}
             }
            .padding()
        }
    }
}

extension FormView4 {
        var topStepBar: some View {
            TopStepBarView(step: 4)
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
                Text("Údaje o rodičoch/partneroch")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.customRed)
            }
            .padding(.vertical, 15)
        }
    
    var publicService: some View {
        Text("Jste nebo byl/a jste Vy nebo partner / ka, k níž má dítě jako nezletilé vztah, v posledních 5 letech před podáním žádosti činný/á ve veřejné službě v Nemecku?")
            .fontWeight(.semibold)
    }
}




#Preview {
    FormView4(viewModel: FormViewModel4())
}
