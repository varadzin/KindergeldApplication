//
//  SingleToggle.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 22.11.23.
//

import SwiftUI

struct SingleToggle: View {
    
    var toggleText: String
   @Binding var toggleState: Bool
    
    var body: some View {
        HStack {
            Toggle(toggleText, isOn: $toggleState)
                .padding(.horizontal, 10)
            Button {} label: {
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(.customRed)
            }
        }
        .padding(.vertical, 10)
    }
    
}
