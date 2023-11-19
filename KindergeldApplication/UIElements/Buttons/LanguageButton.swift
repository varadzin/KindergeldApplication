//
//  LanguageButton.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 14.05.23.
//

import SwiftUI

public struct LanguageButton: View {
 public var body: some View {
    VStack {
      Text("Sprache")
        .font(.system(size: 8))
      Image(systemName: "globe")
      Text("Language")
        .font(.system(size: 8))
        .padding(.bottom, 10)
    }
    .foregroundColor(Color.customRed)
     }
}

struct LanguageButton_Previews: PreviewProvider {
  static var previews: some View {
    LanguageButton()
  }
}
