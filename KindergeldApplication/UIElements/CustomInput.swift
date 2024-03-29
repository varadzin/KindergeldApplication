//
//  CustomInput.swift
//  KindergeldApplication
//
//  Created by Varadzin, Frantisek on 21.11.23.
//

import SwiftUI

struct CustomInput: View {
    let placeholder: String
  @Binding var text: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .minimumScaleFactor(0.05)
                .textFieldStyle(CustomTextField())
            Button(action: action) {
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(.customRed)
            }
        }
    }
}

struct CustomEditor: View {
    let placeholder: String
  @Binding var text: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            TextEditor(
                text: $text)
                .minimumScaleFactor(0.05)
                .textFieldStyle(CustomTextField())
            Button(action: action) {
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(.customRed)
            }
        }
    }
}
