//
//  RaceTimetableView.swift
//  Formula 1
//
//  Created by Olya B on 23.05.2024.
//

import SwiftUI

struct RaceTimetableView: View {    
    var qualificationDate: String
    var raceDate: String
    var qualificationTime: String
    var raceTime: String
    
    var dateExt = Date()
    
    var body: some View {
        VStack(spacing: 15) {
            RaceSessionView(sessionName: "Квалификация", day: dateExt.dayOfWeek(for: qualificationDate), time: qualificationTime)
            RaceSessionView(sessionName: "Гонка", day: dateExt.dayOfWeek(for: raceDate), time: raceTime)
        }
        .padding(10)
        .background(Color.bubbleBackground)
        .cornerRadius(16)
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
    }
}
