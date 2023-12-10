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
    @Published var periodOfService = ""
    @Published var nameOfServiceOffice = ""
    @Published var nameOfFamilienKasse = ""
    
    @Published var nameOfBeneficientAbroad = ""
    @Published var natoQuestion: Bool = false
    @Published var dateOfBirthBeneficientAbroad = ""
    @Published var nameOfBenefitAbroad = ""
    @Published var amountOfBenefitAbroad = ""
    @Published var periodOfBenefitAbroad = ""
    @Published var nameOfOfficeBenefitAbroad = ""
    @Published var referenceBenefitAbroad = ""
    @Published var developingCountriesHelper: Bool = false
    @Published var workAbroadHelper: Bool = false
    
    @Published var nameOfHelperAbroad = ""
    @Published var periodOfHelpAbroad = ""
    @Published var nameOfEmployerAbroad = ""
    @Published var addressOfEmployerAbroad = ""
    @Published var coutryOfEmployerAbroad = ""
}
