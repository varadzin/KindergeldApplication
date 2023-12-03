//
//  NextButton.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 22.11.23.
//


import SwiftUI

public struct BackButton: View {
    
    var action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            HStack {
              Image(systemName: "arrow.backward")
                    .padding(.leading, 10)
            Spacer()
                 
                Text("Späť")
                Spacer(minLength: 150)
            }
            .font(.title)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(Color.customRed)
            .foregroundColor(.white)
            .cornerRadius(10)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .padding(.top, 40)
        }
    }
}

#Preview {
    BackButton {
        print("")
    }
}
