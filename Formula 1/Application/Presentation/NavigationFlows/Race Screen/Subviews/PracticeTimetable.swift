//
//  PracticeTimetable.swift
//  Formula 1
//
//  Created by Olya B on 23.05.2024.
//

import SwiftUI

struct PracticeTimetable: View {
    
    var firstPracticeDate: String
    var secondPracticeDate: String?
    var thirdPracticeDate: String?
    
    var firstPracticeTime: String
    var secondPracticeTime: String?
    var thirdPracticeTime: String?
    
    var dateExt = Date()
    
    var body: some View {
        VStack(spacing: 15) {
            PracticeView(label: "1-я практика", day: dateExt.dayOfWeek(for: firstPracticeDate), time: firstPracticeTime)
            PracticeView(label: "2-я практика", day: dateExt.dayOfWeek(for: secondPracticeDate ?? " - "), time: secondPracticeTime ?? " - ")
            PracticeView(label: "3-я практика", day: dateExt.dayOfWeek(for: thirdPracticeDate ?? " - "), time: thirdPracticeTime ?? " - ")
        }
        .padding(10)
        .background(Color.bubbleBackground)
        .cornerRadius(16)
        .padding(.horizontal, 15)
        .frame(height: 145)
        .padding(.top, 20)
    }
}

struct PracticeView: View {
    var label: String
    var day: String
    var time: String
    
    var body: some View {
        HStack {
            Text(label)
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
