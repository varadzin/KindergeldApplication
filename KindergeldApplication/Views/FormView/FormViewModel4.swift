//
//  FormViewModel4.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 03.12.23.
//

import Foundation

class FormViewModel4: ObservableObject {
    @Published var publicService: Int = 0
    @Published var moneyAbroad: Int = 0
    @Published var nameOfServant = ""
    
    
    
    
    @Published var natoQuestion: Bool = false
}
