//
//  SprintTimetableView.swift
//  Formula 1
//
//  Created by Olya Boyko on 19.07.2024.
//

import SwiftUI

struct SprintTimetableView: View {    
    var sprintQualificationDate: String
    var sprintQualificationTime: String
    
    var sprintDate: String
    var sprintTime: String
    
    var dateExt = Date()
    
    var body: some View {
        VStack(spacing: 15) {
            SprintSessionView(sessionName: "Квалификация",
                              day: dateExt.dayOfWeek(for: sprintQualificationDate),
                              time: sprintQualificationTime)
            SprintSessionView(sessionName: "Спринт", 
                              day: dateExt.dayOfWeek(for: sprintDate),
                              time: sprintTime)
        }
        .padding(10)
        .background(Color.bubbleBackground)
        .cornerRadius(16)
        .padding(.horizontal, 15)
        .padding(.vertical, 18)
    }
}
