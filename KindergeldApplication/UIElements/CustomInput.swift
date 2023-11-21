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
                .textFieldStyle(CustomTextField())
            Button(action: action) {
                Image(systemName: "question.circle")
                    .font(.largeTitle)
                    .foregroundColor(.customRed)
            }
        }
    }
}
