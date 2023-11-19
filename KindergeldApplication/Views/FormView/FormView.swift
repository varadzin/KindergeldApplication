//
//  FormView.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI

struct FormView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TopStepBarView(step: 1)
                        .padding(.vertical, 8)
                
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    toolbarItem
                }
            }
        }
      
    }
}

extension FormView {
    var toolbarItem: some View {
        Button {
            print("Language Button tapped")
        } label: {
            LanguageButton()
        }
    }
}

#Preview {
    FormView()
}
