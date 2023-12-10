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
                segmentPicker1
                publicServiceInfo
                moneyFromAbroad
                segmentPicker2
                moneyFromAbroadInfo
                natoQuestions
                idNumbers
                placeOfLiving
                kindergeldAtHomeland
                subtitle2
                last5years
                freelanceWork
                insurance
                unemployed
                anyBenefit
                BackButton { dismiss() }
                NextButton(destination: FormView5(viewModel: FormViewModel5())) {}
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
    
    var segmentPicker1: some View {
        HStack {
            Picker("", selection: $viewModel.publicService) {
                Text("Áno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            Spacer()
        }
    }
    var publicServiceInfo: some View {
        VStack {
            if viewModel.publicService == 0 {
                CustomInput(placeholder: "Meno, priezvisko zamestnanca", text: $viewModel.nameOfServant) { print("go") }
                CustomInput(placeholder: "Obdobie služby od-do", text: $viewModel.nameOfServant) { print("go") }
                CustomInput(placeholder: "Meno zamestnávateľa / úradu", text: $viewModel.nameOfServant) { print("go") }
                CustomInput(placeholder: "Názov, adresa Familkenkasse", text: $viewModel.nameOfServant) { print("go") }
            }
        }
    }
    
    var moneyFromAbroad: some View {
        Text("Máte nebo měl/a jste Vy alebo partner/ka na dítě v posledních 5 letech před podáním žádosti nárok na peněžité dávky na dítě od nějakého orgánu mimo Německo nebo od nějaké mezistátní nebo nadnárodní instituce?")
            .fontWeight(.semibold)
    }
    
    var segmentPicker2: some View {
        HStack {
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("Áno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
        }
    }
    var moneyFromAbroadInfo: some View {
        VStack {
            if viewModel.moneyAbroad == 0 {
                CustomInput(placeholder: "Meno, priezvisko poberajúcej osoby", text: $viewModel.nameOfServant) { print("go") }
                CustomInput(placeholder: "Dátum narodenia - DD.MM.RRRR", text: $viewModel.nameOfServant) { print("go") }
                CustomInput(placeholder: "Názov dávky", text: $viewModel.nameOfServant) { print("go") }
                CustomInput(placeholder: "Mesačná čiastka v Euro", text: $viewModel.nameOfServant) { print("go") }
                CustomInput(placeholder: "Obdobie poberania od-do", text: $viewModel.nameOfServant) { print("go") }
                CustomInput(placeholder: "Názov a adresa inštitúcie posk. dávku", text: $viewModel.nameOfServant) { print("go") }
                CustomInput(placeholder: "Spisová značka", text: $viewModel.nameOfServant) { print("go") }
            }
        }
    }
    
    var natoQuestions: some View {
        VStack {
            Text("Byl/a jste Vy nebo partner/ka, k níž má dítě jako nezletilé vztah, v posledních 5 letech před podáním žádosti:")
                .padding(.top, 15)
                .fontWeight(.semibold)
            SingleToggle(toggleText: "činný/á mimo Německo jako zaměstnanec, podnikatel, pracovník pomoci rozvojovým zemím?", toggleState: $viewModel.natoQuestion)
            SingleToggle(toggleText: "činný v Německu v pobočce nebo zařízení jiného státu nebo jako příslušník ozbrojených sil NATO?", toggleState: $viewModel.natoQuestion)
            SingleToggle(toggleText: "zaměstnán v Německu na podnět zaměstnavatele se sídlem mimo Německo (kupř. osoba vyslaná na práci v zahraničí)?", toggleState: $viewModel.natoQuestion)
            
            CustomInput(placeholder: "Meno, priezvisko zamestnanca", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Obdobie služby od-do", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Meno zamestnávateľa / úradu", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Adresa zamestnávateľa", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Krajina zárobkovej činnosti", text: $viewModel.nameOfServant) { print("go") }
        }
    }
    
    var idNumbers: some View {
        VStack {
            Text("Ak máte identifikačné číslo v sociálnej poisťovni v Nemecku, tak ho uveďte:")
            CustomInput(placeholder: "číslo poistenia žiadajúcej osoby", text: $viewModel.nameOfServant) { print("go") }
            Text("Ak má identifikačné číslo v sociálnej poisťovni v Nemecku váš životný/á partner/ka, tak ho uveďte:")
            CustomInput(placeholder: "číslo pojištění životného partnera", text: $viewModel.nameOfServant) { print("go") }
            Text("Jen když je bydliště nebo místo obvyklého pobytu žadatele v Německu, uveďte mesiac vstupu do Nemecka:")
            CustomInput(placeholder: "zadajte mesiac a rok vstupu", text: $viewModel.nameOfServant) { print("go") }
        }
        .padding(.vertical)
    }
    
    var placeOfLiving: some View {
        VStack(alignment: .leading) {
            Text("Žije dieťa: Lienka")
            
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("V Nemecku").tag(0)
                Text("Mimo Nemecka").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            CustomInput(placeholder: "Krajina v ktorej dieťa žije", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Od kedy žije dieťa v uvedenej krajine", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Identifikačné číslo", text: $viewModel.nameOfServant) { print("go") }
            
        }
        .padding(.vertical, 15)
        
    }
    
    var kindergeldAtHomeland: some View {
        VStack(alignment: .leading) {
            Text("Pobíráte nebo pobíral/a jste Vy, Váš manžel, resp. životní partner nebo jiná osoba na děti uvedené v „příloze Dítě“ v současné době nebo v posledních pěti letech před podáním žádosti nějaké rodinné dávky k důchodu od instituce mimo Německo, nebo jste o takové zažádal/a? Napr. prídavky na deti vo vašej krajine.")
                .fontWeight(.semibold)
            
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("Àno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            CustomInput(placeholder: "Meno poberateľa dávky", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Priezvisko poberateľa dávky", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Dátum narodenia poberateľa dávky", text: $viewModel.nameOfServant) { print("go") }
            
        }
        .padding(.vertical, 15)
    }
    
    var subtitle2: some View {
        VStack {
            Text("Údaje o žiadateľovi")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.customRed)
        }
        .padding(.vertical, 15)
    }
    var last5years: some View {
        VStack(alignment: .leading) {
            Text("Ste v súčastnosti alebo boli ste v období posledných 5 rokov zamestnaný?")
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
            Text("Ste v súčastnosti alebo boli ste v období posledných 5 rokov samostne zárobkovo činný (samostane zárobkovo činná osoba, fyzická osoba - podnikateľ)")
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
            Text("Máte alebo mali ste v Nemecku nasledovné poistenia?")
                .fontWeight(.semibold)
            HStack {
                Picker("", selection: $viewModel.moneyAbroad) {
                    Text("Áno").tag(0)
                    Text("Nie").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical)
                .frame(maxWidth: 360, alignment: .center)
                Text("socialne poistenie")
            }
            HStack {
                Picker("", selection: $viewModel.moneyAbroad) {
                    Text("Áno").tag(0)
                    Text("Nie").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical)
                .frame(maxWidth: 360, alignment: .center)
                Text("zdravotne poistenie")
            }
            HStack {
                Picker("", selection: $viewModel.moneyAbroad) {
                    Text("Áno").tag(0)
                    Text("Nie").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical)
                .frame(maxWidth: 360, alignment: .center)
                Text("dochodkove poistenie")
            }
            
            Text("Ak podnikáte a nie ste poistený v Nemecku uveďte dôvod:")
                .fontWeight(.semibold)
            
            CustomInput(placeholder: "Dovod", text: $viewModel.nameOfServant) { print("go") }
        }
        .padding(.top, 15)
    }
    
    // TODO: vyries viacriadkovy input
    var unemployed: some View {
        VStack(alignment: .leading) {
            Text("Ste v súčastnosti nezamestnaný?")
                .fontWeight(.semibold)
            
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("Áno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            CustomInput(placeholder: "Uveďte ako hradíte svoje náklady na živobytie", text: $viewModel.nameOfServant) { print("go")
            }
            Text("Hľadáte si prácu?")
                .fontWeight(.semibold)
                .padding(.top, 15)
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("Áno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            
            Text("Jste přihlášen/a u zprostředkovatelny práce Spolkového úřadu práce jako uchazeč o práci?")
                .fontWeight(.semibold)
                .padding(.top, 15)
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("Áno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            Text("Přerušil/a jste v současné době nebo v posledních pěti letech před podáním žádosti dočasně svou výdělečnou činnost kvůli:")
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
            Text("Pobíráte nebo pobíral/a jste na základě tohoto přerušení nějakou peněžitou dávku?")
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
            Text("Pobíráte v současné době nebo pobíral/a jste v posledních pěti letech před podáním žádosti důchod (důchody) nebo dávky sociálního zabezpečení, příp. jste o ně žádal/a?")
                .fontWeight(.semibold)
                .padding(.top, 15)
            Picker("", selection: $viewModel.moneyAbroad) {
                Text("Áno").tag(0)
                Text("Nie").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .frame(maxWidth: 360, alignment: .center)
            CustomInput(placeholder: "Názov úradu poskytujúceho dávku", text: $viewModel.nameOfServant) { print("go") }
            CustomInput(placeholder: "Obdobie vyplácania dávky", text: $viewModel.nameOfServant) { print("go") }
            }
        .padding(.top, 15)
    }
    
}



#Preview {
    FormView4(viewModel: FormViewModel4())
}
