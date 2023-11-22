//
//  PayView.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI

struct PayView: View {
    
    @ObservedObject var viewModel: PayViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    subtitle
                    kindergeldTextfield
                    if viewModel.buttonEnabled {
                        saveKindergeldNumber
                    } else { alertText }
                    text
                    button
                    
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    LanguageButton {
                        print("Language Button Tapped")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showSheet) {
                PayDaysView(viewModel: PayViewModel())
            }
            .onTapGesture {
                hideKeyboard()
            }
            .navigationTitle("PayView_title")
        }
        .navigationBarHidden(true)
        .navigationViewStyle(.stack)
    }
    }

extension PayView {
    var kindergeldTextfield: some View {
        TextField("PayView_placeholder", text: $viewModel.kindergeldNumber)
            .textFieldStyle(KindergeldTextField())
    }
    
    var saveKindergeldNumber: some View {
        
        HStack {
            Checkmark(active: true)
            Text("PayView_check")
                .font(.title3)
        }
    }
    
    var alertText: some View {
        Text(viewModel.alertText)
            .foregroundColor(Color.customRed)
    }
    
    var text: some View {
        Text("PayView_text")
            .padding(10)
    }
    
    var subtitle: some View {
        Text("PayView_subtitle")
            .padding(10)
    }
    
    var button: some View {
        Button {
            viewModel.showSheet = true
        } label: {
            Text("PayView_button")
        }
        .buttonStyle(RedButtonStyle(buttonColor: viewModel.buttonEnabled ? Color.customRed : .systemGray4))
        .frame(height: 60)
        .padding(.vertical, 10)
    }
}

struct PayView_Previews: PreviewProvider {
    static var previews: some View {
        PayView(viewModel: PayViewModel())
    }
}
