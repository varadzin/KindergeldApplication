//
//  RedButtonStyle.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 14.05.23.
//

import SwiftUI

struct RedButtonStyle: ButtonStyle {
  var buttonColor: Color = .red

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.title)
      .fontWeight(.semibold)
      .frame(maxWidth: .infinity, maxHeight: 60)
      .background(Color(UIColor(buttonColor)))
      .foregroundColor(.white)
      .cornerRadius(10)
  }
}
