//
//  DocumentButton.swift
//  KindergeldApplication
//
//  Created by Varadzin, Frantisek on 18.11.23.
//

import SwiftUI

extension PrintView {
    func documentButton(buttonImage: String, buttonText: String, buttonType: ActiveButton) -> some View {
            
        Button {
            activeButton = (activeButton == buttonType) ? .none : buttonType
        } label: {
            VStack {
                Image(systemName: buttonImage)
                    .font(.largeTitle)
                    .padding(4)
                Text(buttonText)
                    .font(.caption)
                    .padding(.horizontal, 5)
            }
        }
        .frame(width: 100, height: 100)
        .foregroundColor(activeButton == buttonType ? Color.customRed : Color.systemGray)
        .background(Color.systemGray6)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 4)
        .padding(10)
    }
}
