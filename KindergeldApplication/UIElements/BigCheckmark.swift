//
//  BigCheckmark.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 14.05.23.
//

import SwiftUI

public struct BigCheckmark: View {

  var active: Bool
  public var body: some View {
    Image(systemName: active ? "checkmark.circle.fill" : "circle")
      .font(.system(size: 40))
      .fontWeight(.light)
      .foregroundColor(Color.customRed)
   }
}

struct BigCheckmark_Previews: PreviewProvider {
  static var previews: some View {
    BigCheckmark(active: false)
  }
}
