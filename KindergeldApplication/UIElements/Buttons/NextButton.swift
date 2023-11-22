//
//  NextButton.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 22.11.23.
//


import SwiftUI

public struct NextButton<Destination: View>: View {
    var destination: Destination
    var action: () -> Void
    
    public var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Spacer()
                Text("Pokračovať")
                Spacer()
                Image(systemName: "arrow.forward")
                    .padding(.trailing, 10)
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
