//
//  HideKeyboard.swift
//  KindergeldApplication
//
//  Created by Frantisek Varadzin on 17.05.23.
//

import UIKit
import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
