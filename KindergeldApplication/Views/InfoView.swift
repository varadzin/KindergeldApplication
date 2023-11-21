//
//  InfoView.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        infoText
    }
}

private extension InfoView {
    var infoText: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("InfoView_title")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("InfoView_text")
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("Language Button tapped")
                    } label: {
                        LanguageButton()
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
    }
}
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
