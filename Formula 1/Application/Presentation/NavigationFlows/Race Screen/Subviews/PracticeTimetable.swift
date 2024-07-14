//
//  PracticeTimetable.swift
//  Formula 1
//
//  Created by Olya B on 23.05.2024.
//

import SwiftUI

struct PracticeTimetable: View {
    
    var body: some View {
        VStack(spacing: 15) {
            PracticeView(label: "1-я практика", day: "Пт", time: "13:30 - 14:30")
            PracticeView(label: "2-я практика", day: "Пт", time: "17:00 - 18:00")
            PracticeView(label: "3-я практика", day: "Сб", time: "12:30 - 13:30")
        }
        .padding(10)
        .background(Color.bubbleBackground)
        .cornerRadius(16)
        .padding(.horizontal, 25)
        .frame(height: 145)
        .padding(.top, 30)
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
                .padding(.leading, 16)
            
            Spacer()
            
            Text(day)
                .foregroundColor(.white.opacity(0.8))
                .font(.system(size: 17, weight: .light))
            
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

struct PracticeTimetable_Previews: PreviewProvider {
    static var previews: some View {
        PracticeTimetable()
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
