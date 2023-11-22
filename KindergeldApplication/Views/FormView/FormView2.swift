//
//  FormView2.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 22.11.23.
//

import SwiftUI

struct FormView2: View {
    
    @ObservedObject var viewModel: FormViewModel
    @Environment (\.dismiss) var dismiss
    
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
                        title2
                        bankAccount
                        postData
                        NextButton(destination: FormView3()) {}
                        BackButton { dismiss() }
                    }
                    
                }
                .padding(.horizontal, 15)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    LanguageButton {
                        print("Language Button Tapped")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .fontWeight(.semibold)
                            Text("Back")
                        }
                        .foregroundColor(.customRed)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .navigationViewStyle(.stack)
    }
}

extension FormView2 {
    
    var topStepBar: some View {
        TopStepBarView(step: 2)
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
            Text("Údaje partnera/ky, manžela/manželky")
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
            CustomInput(placeholder: "Titul", text: $viewModel.womanTitle) { print("go") }
            CustomInput(placeholder: "Krstné meno", text: $viewModel.womanName) { print("go") }
            CustomInput(placeholder: "Priezvisko", text: $viewModel.womanSurname) { print("go") }
            CustomInput(placeholder: "Rodné priezvisko", text: $viewModel.womanMaidenName) { print("go") }
            CustomInput(placeholder: "Dátum narodenia - DD.MM.RRRR", text: $viewModel.womanDateOfBirth) { print("go") }
            CustomInput(placeholder: "Miesto narodenia - mesto a štát", text: $viewModel.womanPlaceOfBirth) { print("go") }
            CustomInput(placeholder: "Štátna príslušnosť", text: $viewModel.womanNationality) { print("go") }
            SingleToggle(toggleText: "Adresa je rozdielna ako žiadateľa", toggleState: $viewModel.addressToggleState)
            
            if viewModel.addressToggleState {
                CustomInput(placeholder: "Adresa - Ulica a číslo domu ", text: $viewModel.womanAddress) { print("go") }
                CustomInput(placeholder: "Adresa - PSČ, mesto, štát", text: $viewModel.womanZipCity) { print("go") }
            }
        }
    }
    
    
    var title2: some View {
        Text("Číslo účtu kam budú zasielané peniaze")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(Color.customRed)
    }
    
    var bankAccount: some View {
        VStack {
            CustomInput(placeholder: "IBAN - číslo účtu", text: $viewModel.iban) { print("go") }
            CustomInput(placeholder: "SWIFT / BIC", text: $viewModel.bic) { print("go") }
            CustomInput(placeholder: "Meno a priezvisko majitela účtu", text: $viewModel.holdersName) { print("go") }
        }
    }
    
    var postData: some View {
        VStack {
            SingleToggle(toggleText: "Poštu nezasielať žiadateľovi, ale", toggleState: $viewModel.postToggle)
            if viewModel.postToggle {
                CustomInput(placeholder: "Krstné meno", text: $viewModel.postName) { print("go") }
                CustomInput(placeholder: "Priezvisko", text: $viewModel.postSurname) { print("go") }
                CustomInput(placeholder: "Adresa - Ulica a číslo domu ", text: $viewModel.postAddress) { print("go") }
                CustomInput(placeholder: "Adresa - PSČ, mesto, štát", text: $viewModel.postZipCity) { print("go") }
                
            }
        }
    }
}



#Preview {
    FormView2(viewModel: FormViewModel())
}
