//
//  FormViewModel3.swift
//  Kindergeld
//
//  Created by Varadzin, Frantisek on 25.11.23.
//

import Foundation

class FormViewModel3: ObservableObject {
    
    @Published var didUniversity: Bool = false
    @Published var uniPeriod = ""
    @Published var uniName = ""
    @Published var socialYear: Bool = false
    @Published var tempPeriod: Bool = false
    @Published var laborOffice: Bool = false
    @Published var didFinishedUni: Bool = false
    @Published var didWork: Bool = false
    @Published var didMiniJob: Bool = false
    @Published var didAnotherJob: Bool = false
    @Published var someDisease: Bool = false
   
}


