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
    @State private var selectedCheckmark: String?
    @State private var selectedCheckmark2: String?
    @State private var selectedCheckmark3: String?
    
    
    var body: some View {
        ScrollView {
            VStack {
                topStepBar
                VStack(alignment: .leading) {
                    title
                    explanationText
                    subtitle
                    formTextFields
                    childRelationship
                    nextPersonData
                    infoFromPast
                    BackButton { dismiss() }
                    NextButton(destination: FormView3(viewModel: FormViewModel3())) {}
                   
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
    
    var childRelationship: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Vzťah dieťaťa ku žiadateľovi")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                Spacer()
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(.customRed)
            }
            
            HStack {
                CustomCheckmark(checkText: "vlastné dieťa", isSelected: .constant(selectedCheckmark == "vlastné dieťa"))
                    .onTapGesture {
                        selectedCheckmark = selectedCheckmark == "vlastné dieťa" ? nil : "vlastné dieťa"
                    }
                CustomCheckmark(checkText: "dieťa v pestúnskej starostlivosti", isSelected: .constant(selectedCheckmark == "dieťa v pestúnskej starostlivosti"))
                    .onTapGesture {
                        selectedCheckmark = selectedCheckmark == "dieťa v pestúnskej starostlivosti" ? nil : "dieťa v pestúnskej starostlivosti"
                    }
            }
            HStack {
                CustomCheckmark(checkText: "nevlastné dieťa", isSelected: .constant(selectedCheckmark == "nevlastné dieťa"))
                    .onTapGesture {
                        selectedCheckmark = selectedCheckmark == "nevlastné dieťa" ? nil : "nevlastné dieťa"
                    }
                CustomCheckmark(checkText: "adoptívne dieťa", isSelected: .constant(selectedCheckmark == "adoptívne dieťa"))
                    .onTapGesture {
                        selectedCheckmark = selectedCheckmark == "adoptívne dieťa" ? nil : "adoptívne dieťa"
                    }
                CustomCheckmark(checkText: "vnúča", isSelected: .constant(selectedCheckmark == "vnúča"))
                    .onTapGesture {
                        selectedCheckmark = selectedCheckmark == "vnúča" ? nil : "vnúča"
                    }
            }
            
            
            
            VStack {
                HStack {
                    Text("Vzťah dieťaťa k partnerovi/ke manželovi/ke")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.top, 10)
                    Spacer()
                    Image(systemName: "questionmark.circle")
                        .font(.largeTitle)
                        .foregroundColor(.customRed)
                }
                
                HStack {
                    CustomCheckmark(checkText: "vlastné dieťa", isSelected: .constant(selectedCheckmark2 == "vlastné dieťa"))
                        .onTapGesture {
                            selectedCheckmark2 = selectedCheckmark2 == "vlastné dieťa" ? nil : "vlastné dieťa"
                        }
                    CustomCheckmark(checkText: "dieťa v pestúnskej starostlivosti", isSelected: .constant(selectedCheckmark2 == "dieťa v pestúnskej starostlivosti"))
                        .onTapGesture {
                            selectedCheckmark2 = selectedCheckmark2 == "dieťa v pestúnskej starostlivosti" ? nil : "dieťa v pestúnskej starostlivosti"
                        }
                }
                
                HStack {
                    CustomCheckmark(checkText: "nevlastné dieťa", isSelected: .constant(selectedCheckmark2 == "nevlastné dieťa"))
                        .onTapGesture {
                            selectedCheckmark2 = selectedCheckmark2 == "nevlastné dieťa" ? nil : "nevlastné dieťa"
                        }
                    CustomCheckmark(checkText: "adoptívne dieťa", isSelected: .constant(selectedCheckmark2 == "adoptívne dieťa"))
                        .onTapGesture {
                            selectedCheckmark2 = selectedCheckmark2 == "adoptívne dieťa" ? nil : "adoptívne dieťa"
                        }
                    CustomCheckmark(checkText: "vnúča", isSelected: .constant(selectedCheckmark2 == "vnúča"))
                        .onTapGesture {
                            selectedCheckmark2 = selectedCheckmark2 == "vnúča" ? nil : "vnúča"
                        }
                }
                
            }
            .background(Color.quaternarySystemFill)
            
            HStack {
                Text("Vzťah dieťaťa k inej osobe, iba ak si to rodinná situácia vyžaduje")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                Spacer()
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(.customRed)
            }
            HStack {
                CustomCheckmark(checkText: "vlastné dieťa", isSelected: .constant(selectedCheckmark3 == "vlastné dieťa"))
                    .onTapGesture {
                        selectedCheckmark3 = selectedCheckmark3 == "vlastné dieťa" ? nil : "vlastné dieťa"
                    }
                CustomCheckmark(checkText: "dieťa v pestúnskej starostlivosti", isSelected: .constant(selectedCheckmark3 == "dieťa v pestúnskej starostlivosti"))
                    .onTapGesture {
                        selectedCheckmark3 = selectedCheckmark3 == "dieťa v pestúnskej starostlivosti" ? nil : "dieťa v pestúnskej starostlivosti"
                    }
            }
            HStack {
                CustomCheckmark(checkText: "nevlastné dieťa", isSelected: .constant(selectedCheckmark3 == "nevlastné dieťa"))
                    .onTapGesture {
                        selectedCheckmark3 = selectedCheckmark3 == "nevlastné dieťa" ? nil : "nevlastné dieťa"
                    }
                CustomCheckmark(checkText: "adoptívne dieťa", isSelected: .constant(selectedCheckmark3 == "adoptívne dieťa"))
                    .onTapGesture {
                        selectedCheckmark3 = selectedCheckmark3 == "adoptívne dieťa" ? nil : "adoptívne dieťa"
                    }
                CustomCheckmark(checkText: "vnúča", isSelected: .constant(selectedCheckmark3 == "vnúča"))
                    .onTapGesture {
                        selectedCheckmark3 = selectedCheckmark3 == "vnúča" ? nil : "vnúča"
                    }
            }
        }
    }
    
    var nextPersonData: some View {
        VStack {
            CustomInput(placeholder: "Meno a priezvisko inej osoby", text: $viewModel.nextPersonName) { print("go") }
            CustomInput(placeholder: "Dátum narodenia - DD.MM.RRRR", text: $viewModel.nextPersonDateOfBirth) { print("go") }
            CustomInput(placeholder: "Posledná známa adresa", text: $viewModel.nextPersonAddress) { print("go") }
            CustomInput(placeholder: "Štátna príslušnosť", text: $viewModel.nextPersonNationality) { print("go") }
            CustomInput(placeholder: "Doplňujúce údaje", text: $viewModel.nextPersonInfo) { print("go") }
        }
    }
    
    
    var infoFromPast: some View {
        VStack(alignment: .leading) {
            Text("Žiadali ste alebo poberali ste vy alebo váš partner/ka na toto dieťa detské prídavky Kindergeld v Nemecku v minulosti?")
                .padding(.top, 10)
            HStack {
                Picker("", selection: $viewModel.didHaveKindergeld) {
                    Text("Áno").tag(0)
                    Text("Nie").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.bottom, 10)
                .frame(maxWidth: 310, alignment: .leading)
                Spacer()
            }
            if viewModel.didHaveKindergeld == 0 {
                CustomInput(placeholder: "Meno, prezvisko poberateľa", text: $viewModel.didHaveKName) { print("go") }
                CustomInput(placeholder: "Dátum narodenia poberateľa", text: $viewModel.didHaveKDateOfBirth) { print("go") }
                CustomInput(placeholder: "obdobie od-do poberania Kindergeld", text: $viewModel.didHaveKWhen) { print("go") }
                CustomInput(placeholder: "Názov, adresa Familkenkasse", text: $viewModel.didHaveKNameFK) { print("go") }
                CustomInput(placeholder: "číslo prídavkov Kindergeld", text: $viewModel.didHaveKNo) { print("go") }
            }
        }
    }
}

#Preview {
    FormView2(viewModel: FormViewModel2())
}
