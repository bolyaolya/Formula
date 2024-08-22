//
//  PracticeTimetableView.swift
//  Formula 1
//
//  Created by Olya B on 23.05.2024.
//

import SwiftUI

struct PracticeTimetableView: View {    
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
