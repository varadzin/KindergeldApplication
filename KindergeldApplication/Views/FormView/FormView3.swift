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
            SingleToggle(toggleText: "absolvoval(a) dobrovolný sociální nebo ekologický rok (zákon o dobrovolnické službě mládeže), evropskou / politickou dobrovolnickou službu v rozvojových zemích, dobrovolnickou službu všech generací, mezinárodní dobrovolnickou službu mládeže, spolkovou dobrovolnickou službu nebo jinou službu v zahraničí (§ 5 spolkový zákon o dobrovolnické službě).", toggleState: $viewModel.socialYear)
            CustomInput(placeholder: "Název vzdělávacího zařízení/druh výuky:", text: $viewModel.uniName) { print("go") }
            
            SingleToggle(toggleText: "absolvoval(a) následující školské, vysokoškolské anebo odborné vzdělání:", toggleState: $viewModel.tempPeriod)
            CustomInput(placeholder: "Název vzdělávacího zařízení/druh výuky:", text: $viewModel.uniName) { print("go") }
            SingleToggle(toggleText: "absolvoval(a) následující školské, vysokoškolské anebo odborné vzdělání:", toggleState: $viewModel.laborOffice)
            CustomInput(placeholder: "Název vzdělávacího zařízení/druh výuky:", text: $viewModel.uniName) { print("go") }
            SingleToggle(toggleText: "absolvoval(a) následující školské, vysokoškolské anebo odborné vzdělání:", toggleState: $viewModel.didFinishedUni)
            CustomInput(placeholder: "Název vzdělávacího zařízení/druh výuky:", text: $viewModel.uniName) { print("go") }
            CustomInput(placeholder: "Název vzdělávacího zařízení/druh výuky:", text: $viewModel.uniName) { print("go") }
            SingleToggle(toggleText: "absolvoval(a) následující školské, vysokoškolské anebo odborné vzdělání:", toggleState: $viewModel.didWork)
            SingleToggle(toggleText: "absolvoval(a) následující školské, vysokoškolské anebo odborné vzdělání:", toggleState: $viewModel.didMiniJob)
            CustomInput(placeholder: "Název vzdělávacího zařízení/druh výuky:", text: $viewModel.uniName) { print("go") }
            SingleToggle(toggleText: "absolvoval(a) následující školské, vysokoškolské anebo odborné vzdělání:", toggleState: $viewModel.didAnotherJob)
            
            CustomInput(placeholder: "Název vzdělávacího zařízení/druh výuky:", text: $viewModel.uniName) { print("go") }
            CustomInput(placeholder: "Název vzdělávacího zařízení/druh výuky:", text: $viewModel.uniName) { print("go") }
            
            SingleToggle(toggleText: "absolvoval(a) následující školské, vysokoškolské anebo odborné vzdělání:", toggleState: $viewModel.someDisease)
            SingleToggle(toggleText: "absolvoval(a) následující školské, vysokoškolské anebo odborné vzdělání:", toggleState: $viewModel.didUniversity)
            
        }
        
        
        
    }
    
}


#Preview {
    FormView3(viewModel: FormViewModel3())
}
