//
//  TopStepBarView.swift
//  KindergeldApplication
//
//  Created by Varadzin, Frantisek on 19.11.23.
//

import SwiftUI


struct TopStepBarView: View {
    
    let step: Int
    
    var body: some View {
        HStack {
            ball(number: "1", colorFill: step >= 1 ? .customRed : .gray)
            line()
            ball(number: "2", colorFill: step >= 2 ? .customRed : .gray)
            line()
            ball(number: "3", colorFill: step >= 3 ? .customRed : .gray)
            line()
            ball(number: "4", colorFill: step >= 4 ? .customRed : .gray)
            line()
            ball(number: "5", colorFill: step >= 5 ? .customRed : .gray)
        }
    }
}

extension TopStepBarView {
    func ball(number: String, colorFill: Color) -> some View {
        ZStack {
            Circle()
                .fill(colorFill)
                .frame(width: 30, height: 30)
            Text(number)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
    }
    
    func line() -> some View {
        Rectangle()
            .fill(Color.customRed)
            .frame(width: 35, height: 3)
    }
}


#Preview {
    TopStepBarView(step: 1)
}
