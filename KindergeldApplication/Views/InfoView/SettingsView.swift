//
//  SettingsView.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 10.03.24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        infoText
    }
}

private extension SettingsView {
    var infoText: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Your settings here")
                }
                .padding()
            }
                 .navigationTitle("Settings")
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
         }
}
