//
//  SaveButton.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 10.12.23.
//

import SwiftUI

public struct SaveButton: View {

    public var body: some View {
        Button{} label: {
            HStack {
                Spacer()
                Text("Ulozit")
                Spacer()
              }
            .font(.title)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(Color.customRed)
            .foregroundColor(.white)
            .cornerRadius(10)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
        }
    }
}
