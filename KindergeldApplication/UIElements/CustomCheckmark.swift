//
//  CustomCheckmark.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 24.11.23.
//

import SwiftUI

struct CustomCheckmark: View {
    let checkText: String
    @Binding var isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                .font(.title)
                .foregroundColor(.customRed)
            Text(checkText)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .padding(.horizontal, 20)
    }
}

