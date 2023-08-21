//
//  ContentView.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI

struct StartView: View {
    
    @State private var checkmarkActive: Bool = false
    @State private var showSheet: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    backgroundImage
                    disclaimer
                    button
                }
                logo
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
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    var logo: some View {
        Image("logo")
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    var button: some View {
        NavigationLink {
            MainTab()
        } label: {
            Text("Start")
        }
        .buttonStyle(RedButtonStyle(buttonColor: checkmarkActive ? .red : .systemGray4))
        .padding(.horizontal, 10)
        //    .disabled(checkmarkActive ? false : true)
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
                        .foregroundColor(.red)
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

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
