//
//  FormViewModel5.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 10.12.23.
//

import Foundation

class FormViewModel5: ObservableObject {
    @Published var publicService: Int = 0
    @Published var spouseHasJob: Int = 0
    @Published var nameOfSpouseEmployer = ""
    @Published var addressOfSpouseEmployer = ""
    @Published var periodSpouseEmployment = ""
    @Published var workingHoursSpouseEmployment = ""
    @Published var placeSpouseEmployment = ""
    @Published var natoQuestion: Bool = false
    @Published var freelanceWorkSpouse: Int = 0
    @Published var nameOfSpouseFreelanceJob = ""
    @Published var typeOfSpouseFreelanceJob = ""
    @Published var addressOfSpouseFreelanceJob = ""
    @Published var periodOfSpouseFreelanceJob = ""
    @Published var workingHoursOfSpouseFreelanceJob = ""
    @Published var spouseSocialInsurance: Int = 0
    @Published var reasonForNoInsuranceSpouse = ""
    @Published var workInteruptedSpouseIllnes: Int = 0
    @Published var workInteruptedSpouseUnemployed: Int = 0
    @Published var workInteruptedSpouseMaternity: Int = 0
    @Published var workInteruptedSpouseChild: Int = 0
    @Published var workInteruptedSpouseWorkAccident: Int = 0
    @Published var spouseHasBenefit: Int = 0
    @Published var nameOfSpouseBenefit = ""
    @Published var whoGivesSpouseBenefit = ""
    @Published var periodOfSpouseBenefit = ""
    @Published var spouseRetirementBenefit: Int = 0
    @Published var nameWhoBecomesBenefitSpouse = ""
    @Published var surenameWhoBecomesBenefitSpouse = ""
    @Published var dateOfBirthWhoBecomesBenefitSpouse = ""
    @Published var nameOfOfficeGivesBenefitSpouse = ""
    @Published var periodBenefitSpouse = ""
}
