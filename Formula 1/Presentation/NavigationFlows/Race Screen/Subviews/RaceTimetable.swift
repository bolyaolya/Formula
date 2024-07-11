//
//  RaceTimetable.swift
//  Formula 1
//
//  Created by Olya B on 23.05.2024.
//

import SwiftUI

struct RaceTimetable: View {
    var body: some View {
        VStack(spacing: 15) {
            RaceSessionView(sessionName: "Квалификация", day: "Сб", time: "16:00 - 17:00")
            RaceSessionView(sessionName: "Гонка", day: "Вс", time: "15:00")
        }
        .padding(10)
        .background(Color.bubbleBackground)
        .cornerRadius(16)
        .padding(.horizontal, 25)
        .padding(.vertical, 26)
    }
}

struct RaceSessionView: View {
    var sessionName: String
    var day: String
    var time: String
    
    var body: some View {
        HStack {
            Text(sessionName)
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

struct RaceTimetable_Previews: PreviewProvider {
    static var previews: some View {
        RaceTimetable()
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
