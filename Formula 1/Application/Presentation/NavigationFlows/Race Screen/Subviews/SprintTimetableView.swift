//
//  SprintTimetableView.swift
//  Formula 1
//
//  Created by Olya Boyko on 19.07.2024.
//

import SwiftUI

struct SprintTimetableView: View {    
    var sprintQualyDate: String
    var sprintQualyTime: String
    
    var sprintDate: String
    var sprintTime: String
    
    var dateExt = Date()
    
    var body: some View {
        VStack(spacing: 15) {
            SprintSessionView(sessionName: "Квалификация",
                              day: dateExt.dayOfWeek(for: sprintQualyDate),
                              time: sprintQualyTime)
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

struct SprintSessionView: View {
    var sessionName: String
    var day: String
    var time: String
    
    var body: some View {
        HStack {
            Text(sessionName)
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .regular))
                .padding(.leading, 10)
            
            Spacer()
            
            Text(day)
                .foregroundColor(.white.opacity(0.8))
                .font(.system(size: 16, weight: .light))
                .padding(.trailing, 25)
            
            Text(time)
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .semibold))
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.trailing, 10)
        }
    }
}
