//
//  FormView2.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 22.11.23.
//

import SwiftUI

struct FormView2: View {
    
    @ObservedObject var viewModel: FormViewModel2
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
                 ScrollView {
                VStack {
                    topStepBar
                    VStack(alignment: .leading) {
                        title
                        explanationText
                        subtitle
                        formTextFields
//                        title2
//                        bankAccount
//                        postData
                        NextButton(destination: FormView3()) {}
                        BackButton { dismiss() }
                    }
                    
                }
                .padding(.horizontal, 15)
            }

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
            Text("Údaje o deťoch")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.customRed)
               }
        .padding(.vertical, 15)
    }
    
    var formTextFields: some View {
        VStack {
            CustomInput(placeholder: "Meno dieťaťa", text: $viewModel.child1Name) { print("go") }
            CustomInput(placeholder: "Priezvisko ak sa líši od žiadateľa", text: $viewModel.child1Surename) { print("go") }
         
            CustomInput(placeholder: "Dátum narodenia - DD.MM.RRRR", text: $viewModel.child1DateOfBirth) { print("go") }
            segmentPicker
            SingleToggle(toggleText: "Na toto dieťa ešte nepoberám prídavky v Nemecku", toggleState: $viewModel.noKindergeldChild1ToggleState)
            CustomInput(placeholder: "Miesto narodenia - mesto a štát", text: $viewModel.child1PlaceOfBirth) { print("go") }
            CustomInput(placeholder: "Štátna príslušnosť", text: $viewModel.child1Nationality) { print("go") }
            SingleToggle(toggleText: "Adresa je rozdielna ako žiadateľa", toggleState: $viewModel.addressChild1ToggleState)
            
            if viewModel.addressChild1ToggleState {
                CustomInput(placeholder: "Adresa - Ulica a číslo domu ", text: $viewModel.child1Address) { print("go") }
                CustomInput(placeholder: "Adresa - PSČ, mesto, štát", text: $viewModel.child1ZipCity) { print("go") }
                CustomInput(placeholder: "Dôvod prečo je adresa odlišná", text: $viewModel.child1AddressReason) { print("go") }
            }
            CustomInput(placeholder: "Daňové číslo dieťaťa, ak má", text: $viewModel.child1TaxNo) { print("go") }
        }
    }
    
    var segmentPicker: some View {
        HStack {
            Picker("", selection: $viewModel.selectedSex) {
                Text("Dieťa je chlapec").tag(0)
                Text("Dieťa je dievča").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 310, alignment: .leading)
            Spacer()
        }
    }
//
//    var title2: some View {
//        Text("Číslo účtu kam budú zasielané peniaze")
//            .font(.largeTitle)
//            .fontWeight(.bold)
//            .foregroundStyle(Color.customRed)
//    }
//    
//    var bankAccount: some View {
//        VStack {
//            CustomInput(placeholder: "IBAN - číslo účtu", text: $viewModel.iban) { print("go") }
//            CustomInput(placeholder: "SWIFT / BIC", text: $viewModel.bic) { print("go") }
//            CustomInput(placeholder: "Meno a priezvisko majitela účtu", text: $viewModel.holdersName) { print("go") }
//        }
//    }
//    
//    var postData: some View {
//        VStack {
//            SingleToggle(toggleText: "Poštu nezasielať žiadateľovi, ale", toggleState: $viewModel.postToggle)
//            if viewModel.postToggle {
//                CustomInput(placeholder: "Krstné meno", text: $viewModel.postName) { print("go") }
//                CustomInput(placeholder: "Priezvisko", text: $viewModel.postSurname) { print("go") }
//                CustomInput(placeholder: "Adresa - Ulica a číslo domu ", text: $viewModel.postAddress) { print("go") }
//                CustomInput(placeholder: "Adresa - PSČ, mesto, štát", text: $viewModel.postZipCity) { print("go") }
//                
//            }
//        }
//    }
}



#Preview {
    FormView2(viewModel: FormViewModel2())
}
