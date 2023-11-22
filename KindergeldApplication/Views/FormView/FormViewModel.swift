//
//  FormViewModel.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 21.11.23.
//

import Foundation

class FormViewModel: ObservableObject {
    
    @Published var manTitle = ""
    @Published var manName = ""
    @Published var manSurname = ""
    @Published var manMaidenName = ""
    @Published var manDateOfBirth = ""
    @Published var manPlaceOfBirth = ""
    @Published var manNationality = ""
    @Published var manAddress = ""
    @Published var manZipCity = ""
    
    @Published var womanTitle = ""
    @Published var womanName = ""
    @Published var womanSurname = ""
    @Published var womanMaidenName = ""
    @Published var womanDateOfBirth = ""
    @Published var womanPlaceOfBirth = ""
    @Published var womanNationality = ""
    @Published var womanAddress = ""
    @Published var womanZipCity = ""
    @Published var addressToggleState: Bool = false
    
    @Published var selectedSex: Int = 0
    @Published var status: Int? = nil
    @Published var statusDate = ""
    @Published var iban = ""
    @Published var bic = ""
    @Published var holdersName = ""
    @Published var postToggle: Bool = false
    @Published var postName = ""
    @Published var postSurname = ""
    @Published var postAddress = ""
    @Published var postZipCity = ""
  
    
    func statusText(for index: Int) -> String {
        switch index {
        case 0: return "Slobodná - Slobodný"
             case 1: return "Vydatá - Ženatý"
             case 2: return "Vdova - Vdovec"
             case 3: return "Rozvedená - Rozvedený"
             case 4: return "Registrované partnerstvo"
             case 5: return "Žijeme oddelene"
             default: return "Slobodná/ý"
        }
    }
    
}
