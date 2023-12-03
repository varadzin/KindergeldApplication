//
//  FormView3.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 22.11.23.
//

import SwiftUI

struct FormView3: View {
    
    @ObservedObject var viewModel: FormViewModel3
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            topStepBar
            VStack (alignment: .leading) {
                title
                explanationText
                subtitle
                child1
                child1Toggles
                Spacer()
                BackButton { dismiss() }
                NextButton(destination: FormView4(viewModel: FormViewModel4())) {}
             }
            .padding()
        }
    }
}

extension FormView3 {
    var topStepBar: some View {
        TopStepBarView(step: 3)
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
            Text("Údaje o plnoletom alebo čoskoro plnoletom dieťati")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.customRed)
        }
        .padding(.vertical, 15)
    }
    
    var child1: some View {
        VStack(alignment: .leading) {
            Text("Dieta: Lenka")
                .fontWeight(.semibold)
                .padding(.horizontal)
            SingleToggle(toggleText: "absolvoval(a) následující školské, vysokoškolské anebo odborné vzdělání:", toggleState: $viewModel.didUniversity)
            if viewModel.didUniversity {
                CustomInput(placeholder: "zadajte dátum od  - do", text: $viewModel.uniPeriod) { print("go") }
                CustomInput(placeholder: "Název vzdělávacího zařízení/druh výuky:", text: $viewModel.uniName) { print("go") }
            }
        }
    }
    
    var child1Toggles: some View {
        VStack {
            SingleToggle(toggleText: "nemůže/nemohlo z důvodu nedostatku vzdělávacích míst profesní vzdělávání začít nebo v něm pokračovat", toggleState: $viewModel.tempPeriod)
            CustomInput(placeholder: "zadajte dátum od  - do", text: $viewModel.uniPeriod) { print("go") }
            SingleToggle(toggleText: "absolvoval(a) dobrovolný sociální nebo ekologický rok (zákon o dobrovolnické službě mládeže), evropskou / politickou dobrovolnickou službu v rozvojových zemích, dobrovolnickou službu všech generací, mezinárodní dobrovolnickou službu mládeže, spolkovou dobrovolnickou službu nebo jinou službu v zahraničí (§ 5 spolkový zákon o dobrovolnické službě).", toggleState: $viewModel.socialYear)
            CustomInput(placeholder: "zadajte dátum od  - do", text: $viewModel.uniName) { print("go") }
            
            SingleToggle(toggleText: "se nacházelo/nachází v přechodném období maximálně čtyř měsíců (např. mezi dvěma úseky vzdělávání).", toggleState: $viewModel.tempPeriod)
            CustomInput(placeholder: "zadajte dátum od  - do", text: $viewModel.uniName) { print("go") }
            SingleToggle(toggleText: "bylo/je bez zaměstnánía přihlášeno na úřadu práce jako osoba hledající práci.", toggleState: $viewModel.laborOffice)
            CustomInput(placeholder: "zadajte dátum od  - do", text: $viewModel.uniName) { print("go") }
            SingleToggle(toggleText: "Dítě již ukončilo profesní vzdělávání nebo studium, resp. jej v krátké době ukončí", toggleState: $viewModel.didFinishedUni)
            Text("Ukončené odborné vzdělání/ukončení studia (s uvedením oboru):")
            CustomInput(placeholder: "zadajte názov oboru", text: $viewModel.uniName) { print("go") }
            CustomInput(placeholder: "zadajte dátum ukončenia", text: $viewModel.uniName) { print("go") }
                .padding(.bottom, 15)
            SingleToggle(toggleText: "Dítě bylo/je výdělečně činné, resp. bude výdělečně činné", toggleState: $viewModel.didWork)
            SingleToggle(toggleText: "Robilo jedno nebo více drobných zaměstnání ve smyslu §§ 8, 8a sociálního zákoníku IV (tzv. mini job", toggleState: $viewModel.didMiniJob)
            CustomInput(placeholder: "zadajte dátum od  - do", text: $viewModel.uniName) { print("go") }
                .padding(.bottom, 10)
            SingleToggle(toggleText: "jiné výdělečné činnosti (u více zaměstnání údaje na zvláštním listu)", toggleState: $viewModel.didAnotherJob)
            
            CustomInput(placeholder: "zadajte dátum od  - do", text: $viewModel.uniName) { print("go") }
            Text("Celková (dohodnutá) pravidelná týdenní pracovní doba:")
            CustomInput(placeholder: "Název vzdělávacího zařízení/druh výuky:", text: $viewModel.uniName) { print("go") }
            
            Text("Nadřízený úřad, resp. zaměstnavatel (jméno, adresa):")
            CustomInput(placeholder: "zadajte údaje zamestnávateľa", text: $viewModel.uniName) { print("go") }
            
            SingleToggle(toggleText: "Údaje v případě postižení \nMá dítě postižení, které se vyskytlo před uplynutím 25. roku života?", toggleState: $viewModel.didUniversity)
                .padding(.top, 15)
        }
    }
}


#Preview {
    FormView3(viewModel: FormViewModel3())
}
