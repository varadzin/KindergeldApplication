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
                    Text("InfoView_text")
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
            .navigationTitle("InfoView_title")
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
