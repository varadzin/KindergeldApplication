//
//  PayViewDates.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 17.05.23.
//

import SwiftUI

struct PayDaysView: View {
  @ObservedObject var viewModel: PayViewModel

  @AppStorage("lastCharacterOfKG") var lastCharacterOfKG: String = ""
  @AppStorage("KGnumber") var KGnumber: String = ""

  var body: some View {
    titel
    payDays
    text
  }
}

extension PayDaysView {
  var titel: some View {
    VStack {
      Text("Výplatné termíny pre číslo:")
      Text(KGnumber)
        .foregroundColor(Color.customRed)
    }
    .font(.largeTitle)
  }

  var payDays: some View {
    VStack {
      Text(viewModel.payTermsForYou)
      Text("last cahr je : \(viewModel.payTermsForYou)")
    }
  }

  var text: some View {
    Text("Podľa rýchlosti prevodu vašej banky a môžu peniaze oneskoriť o 1 deň.")
  }
}

struct PayViewDates_Previews: PreviewProvider {
  static var previews: some View {
    PayDaysView(viewModel: PayViewModel())
  }
}
