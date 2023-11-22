//
//  ContentView.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI
import UIKit

struct StartView: View {
    
    @State private var checkmarkActive: Bool = false
    @State private var showSheet: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundImage
                ZStack {
                    logo
                    VStack {
                        Spacer(minLength: 650)
                        disclaimer
                        button
                        Spacer(minLength: 30)
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                TermsOfUseView()
            }
        }
    }
}

extension StartView {
    var backgroundImage: some View {
        Image("startImage")
            .resizable()
            .ignoresSafeArea()
            .scaledToFill() // TODO: if !isIPad .scaledToFit()
            .frame(maxWidth: UIDevice.isIPad ? 600 : .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    var logo: some View {
        VStack {
            Image("logo")
                .padding(.horizontal, 20)
                .padding(.top, 50)
            Spacer()
        }
    }
    
    var button: some View {
        NavigationLink {
            MainTab()
        } label: {
            Text("Start")
        }
        .buttonStyle(RedButtonStyle(buttonColor: checkmarkActive ? Color.customRed : .systemGray4))
        .padding(.horizontal, 10)
        //    .disabled(checkmarkActive ? false : true)
        .frame(maxWidth: UIDevice.isIPad ? 600 : 380)
    }
    
    var disclaimer: some View {
        HStack {
            Checkmark(active: checkmarkActive)
                .onTapGesture {
                    checkmarkActive.toggle()
                }
            VStack(alignment: .leading) {
                HStack {
                    Text("Čítal/a som")
                    Text("podmienky používania aplikácie")
                        .foregroundColor(Color.customRed)
                        .fontWeight(.bold)
                }
                Text("a jej používaním potvrdzujem svoj súhlas")
            }
            .lineLimit(1)
            .minimumScaleFactor(0.25)
            .padding(.horizontal, 10)
            .onTapGesture {
                showSheet.toggle()
            }
        }
        .padding(.leading, 5)
        .padding(.bottom, 30)
    }
}

extension UIDevice {
    static var isIPad: Bool {
        return current.userInterfaceIdiom == .pad
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
