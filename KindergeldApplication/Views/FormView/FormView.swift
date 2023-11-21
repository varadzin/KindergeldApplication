//
//  FormView.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI

struct FormView: View {
    
    @ObservedObject var viewModel: FormViewModel
    
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
                        statusToggle
                        statusDate
                        nextButton
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
        .navigationViewStyle(.stack)
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
            CustomInput(placeholder: "Titul", text: $viewModel.manTitle) { print("go") }
            CustomInput(placeholder: "Krstné meno", text: $viewModel.manName) { print("go") }
            CustomInput(placeholder: "Priezvisko", text: $viewModel.manSurname) { print("go") }
            CustomInput(placeholder: "Rodné priezvisko", text: $viewModel.manMaidenName) { print("go") }
            CustomInput(placeholder: "Dátum narodenia - DD.MM.RRRR", text: $viewModel.manDateOfBirth) { print("go") }
            CustomInput(placeholder: "Miesto narodenia - mesto a štát", text: $viewModel.manPlaceOfBirth) { print("go") }
            segmentPicker
            CustomInput(placeholder: "Štátna príslušnosť", text: $viewModel.manNationality) { print("go") }
            CustomInput(placeholder: "Adresa - Ulica a číslo domu ", text: $viewModel.manAddress) { print("go") }
            CustomInput(placeholder: "Adresa - PSČ, mesto, štát", text: $viewModel.manZipCity) { print("go") }
        }
    }
    
    var segmentPicker: some View {
        HStack {
            Picker("", selection: $viewModel.selectedSex) {
                Text("Žiadateľ je muž").tag(0)
                Text("Žiadateľka je žena").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 310, alignment: .leading)
            Spacer()
        }
    }
    
    var statusToggle: some View {
        VStack {
            ForEach(0..<6) { index in
                Toggle(viewModel.statusText(for: index), isOn: Binding(
                    get: { viewModel.status == index },
                    set: { isOn in
                        if isOn { viewModel.status = index
                        } else {
                            viewModel.status = nil
                        }
                    }
                ))
            }
        }
        .frame(maxWidth: 310, alignment: .leading)
        .padding(.horizontal, 15)
    }
    
    var statusDate: some View {
        VStack {
            if viewModel.status != 0 {
                return AnyView( CustomInput(placeholder: "Od kedy: ", text: $viewModel.statusDate) {
                    print("gogo")
                })
            } else {
                return AnyView(EmptyView())
            }
        }
        .padding(.vertical, 8)
    }
    
    var nextButton: some View {
        RedButton(title: "Pokračovať      ->")
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .padding(.top, 40)
            .padding(.bottom, 20)
    }
}



#Preview {
    FormView(viewModel: FormViewModel())
}
