//
//  FormViewModel5.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 10.12.23.
//

import Foundation

class FormViewModel5: ObservableObject {
    @Published var publicService: Int = 0
    @Published var moneyAbroad: Int = 0
    @Published var nameOfServant = ""
    
    
    
    
    @Published var natoQuestion: Bool = false
}
