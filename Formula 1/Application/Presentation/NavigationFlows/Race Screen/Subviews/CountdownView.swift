//
//  CountdownView.swift
//  Formula 1
//
//  Created by Olya B on 23.05.2024.
//

import SwiftUI

struct CountdownView: View {    
    var days: Int
    var hours: Int
    var minutes: Int
    
    var body: some View {
        HStack(spacing: 30) {
            TimeView(imageName: "timeSquare", count: days, labelKey: "daysTillRace")
            TimeView(imageName: "timeSquare", count: hours, labelKey: "hoursTillRace")
            TimeView(imageName: "timeSquare", count: minutes, labelKey: "minutesTillRace")
        }
        .frame(height: 90)
        .padding(.top, 18)
        .padding(.horizontal, 66)
    }
}
