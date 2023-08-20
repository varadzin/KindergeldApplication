//
//  
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 14.05.23.
//

import SwiftUI

struct KindergeldTextField: TextFieldStyle {
  // swiftlint:disable:next identifier_name
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .frame(height: 40)
      .disableAutocorrection(true)
      .autocapitalization(.none)
      .font(.system(size: 20))
      .foregroundColor(.red)
      .multilineTextAlignment(.center)
      .padding(10)
      .background(Color.systemGray6)
      .textFieldStyle(.plain)
      .cornerRadius(8)
  }
}
