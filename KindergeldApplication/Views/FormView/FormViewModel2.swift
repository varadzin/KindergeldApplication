//
//  FormViewModel2.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 23.11.23.
//

import Foundation

class FormViewModel2: ObservableObject {
    
    @Published var child1Name = ""
    @Published var child1Surename = ""
    @Published var child1DateOfBirth = ""
    @Published var child1PlaceOfBirth = ""
    @Published var child1Nationality = ""
    @Published var child1Address = ""
    @Published var child1ZipCity = ""
    @Published var child1TaxNo = ""
    @Published var addressChild1ToggleState: Bool = false
    @Published var selectedSex: Int = 0
    @Published var child1AddressReason = ""
    @Published var noKindergeldChild1ToggleState: Bool = false
    
    
    @Published var nextPersonName = ""
    @Published var nextPersonDateOfBirth = ""
    @Published var nextPersonAddress = ""
    @Published var nextPersonNationality = ""
    @Published var nextPersonInfo = ""
    @Published var didHaveKindergeld: Int = 1
    
    @Published var didHaveKName = ""
    @Published var didHaveKDateOfBirth = ""
    @Published var didHaveKWhen = ""
    @Published var didHaveKNameFK = ""
    @Published var didHaveKNo = ""
}


