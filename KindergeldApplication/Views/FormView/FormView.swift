//
//  FormView.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI

struct FormView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                TopStepBarView(step: 1)
                    .padding(.vertical, 8)
                Spacer()
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
