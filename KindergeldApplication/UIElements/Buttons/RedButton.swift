//
//  redButton.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI

public struct RedButton: View {
    var title: String
    var buttonColor: Color? = Color.customRed
    var buttonImage: String?
    
    public var body: some View {
        HStack {
            Image(systemName: buttonImage ?? "")
            Text("\(title)")
        }
        .font(.title)
        .fontWeight(.semibold)
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background(buttonColor)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

struct RedButton_Previews: PreviewProvider {
    static var previews: some View {
        RedButton(title: "Start", buttonImage: "paperplane.fill")
    }
}
