//
//  AcitveButtonEnum.swift
//  KindergeldApplication
//
//  Created by Varadzin, Frantisek on 18.11.23.
//

import Foundation

enum ActiveButton: Equatable {
    case none
    case viewDocument(Int)
    case sendDocument(Int)
    case printDocument(Int)
}
