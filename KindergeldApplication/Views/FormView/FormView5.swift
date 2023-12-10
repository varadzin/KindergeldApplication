//
//  FormView5.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 10.12.23.
//

import SwiftUI

struct FormView5: View {
    
    @ObservedObject var viewModel: FormViewModel5
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            topStepBar
            VStack (alignment: .leading) {
                title
                explanationText
                subtitle
                last5years
                freelanceWork
                insurance
                unemployed
                anyBenefit
                
                BackButton { dismiss() }
                SaveButton()
            }
            .padding()
        }
    }
}

extension FormView5 {
    var topStepBar: some View {
        TopStepBarView(step: 5)
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
            Text("Údaje o manželovi / ke partnerovi / ke")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.customRed)
        }
        .padding(.vertical, 15)
    }
    
    var last5years: some View {
        VStack(alignment: .leading) {
            Text("Je Váš manžel/ka, resp. životní partner/ka, v současné době nebo byl v posledních pěti letech před podáním žádosti zamestnaný?")
                .fontWeight(.semibold)
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("Áno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            CustomInput(placeholder: "Názov zamestnávateľa", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Adresa zamestnávateľa", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Obdobie trvania prac. pomeru", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Pravidelná týždenná pracovná doba", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Miesto výkonu práce", text: $viewModel.nameOfServant) { print("go") }
        }
    }
    
    var freelanceWork: some View {
        VStack(alignment: .leading) {
            Text("Je Váš manžel /ka, resp. životní partner /ka, v současné době nebo byl v posledních pěti letech před podáním žádosti  samostne zárobkovo činný (samostane zárobkovo činná osoba, fyzická osoba - podnikateľ)?")
                .fontWeight(.semibold)
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("Áno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            CustomInput(placeholder: "Uveďte formu podnikania", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Nazov", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Adresa", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Obdobbie od - do", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Pravidelná týždenná pracovná doba", text: $viewModel.nameOfServant) { print("go") }
        }
        .padding(.top, 15)
    }
    
    var insurance: some View {
        VStack(alignment: .leading) {
            Text("Má/mají nebo měla/y jmenovaná/é osoba/osoby z důvodu této výdělečné činnosti v Německu sociální pojištění?")
                .fontWeight(.semibold)
            
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("Áno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            Text("Ak nie, tak uveďte dôvod:")
                .fontWeight(.semibold)
            
            CustomInput(placeholder: "Dovod", text: $viewModel.nameOfServant) { print("go") }
        }
        .padding(.top, 15)
    }
    
    // TODO: vyries viacriadkovy input
    var unemployed: some View {
        VStack(alignment: .leading) {
            Text("Přerušil/a manžel/ka, partner/ka v současné době nebo v posledních pěti letech před podáním žádosti dočasně svou výdělečnou činnost kvůli:")
                .fontWeight(.semibold)
            HStack {
                Picker("", selection: $viewModel.moneyAbroad) {
                    Text("Áno").tag(0)
                    Text("Nie").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical)
                .frame(width: 200, alignment: .center)
                Text("nezamestnanosti")
            }
            HStack {
                Picker("", selection: $viewModel.moneyAbroad) {
                    Text("Áno").tag(0)
                    Text("Nie").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical)
                .frame(width: 200, alignment: .center)
                Text("nemoci")
            }
            HStack {
                Picker("", selection: $viewModel.moneyAbroad) {
                    Text("Áno").tag(0)
                    Text("Nie").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical)
                .frame(width: 200, alignment: .center)
                Text("materstvu")
            }
            
            HStack {
                Picker("", selection: $viewModel.moneyAbroad) {
                    Text("Áno").tag(0)
                    Text("Nie").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical)
                .frame(width: 200, alignment: .center)
                Text("vychovy deti")
            }
            HStack {
                Picker("", selection: $viewModel.moneyAbroad) {
                    Text("Áno").tag(0)
                    Text("Nie").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical)
                .frame(width: 200, alignment: .center)
                Text("pracovnemu urazu")
            }
            
        }
        .padding(.top, 15)
    }
    
    var anyBenefit: some View {
        VStack(alignment: .leading) {
            Text("Pobírá nebo pobíral/a manžel/ka, partner/ka na základě tohoto přerušení nějakou peněžitou dávku?")
                .fontWeight(.semibold)
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("Áno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            Text("O jakou peněžitou dávku se jedná?")
            CustomInput(placeholder: "Názov dávky", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Názov úradu poskytujúceho dávku", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Obdobie poskytovania dávky od-do", text: $viewModel.nameOfServant) { print("go") }
            Text("Pobírá Váš manžel, resp. životní partner nebo jiná osoba, v současné době nebo pobíral/a v posledních pěti letech před podáním žádosti důchod (důchody) nebo dávky sociálního zabezpečení, resp. bylo o toto zažádáno?")
                .fontWeight(.semibold)
                .padding(.top, 15)
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("Áno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            CustomInput(placeholder: "Meno príjímateľa dávky", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Priezvisko príjímateľa dávky", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Dátum narodenia príjímateľa dávky", text: $viewModel.nameOfServant) { print("go") }
            
            CustomInput(placeholder: "Názov úradu poskytujúceho dávku", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Obdobie vyplácania dávky", text: $viewModel.nameOfServant) { print("go") }
        }
        .padding(.top, 15)
    }
}
