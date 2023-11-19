//
//  Checkmark.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 11.05.23.
//

import SwiftUI

public struct Checkmark: View {

  var active: Bool
  public var body: some View {
    Image(systemName: active ? "checkmark.circle.fill" : "circle")
      .font(.system(size: 30))
      .fontWeight(.light)
      .foregroundColor(Color.customRed)
   }
}

struct Checkmark_Previews: PreviewProvider {
  static var previews: some View {
    Checkmark(active: true)
  }
}
