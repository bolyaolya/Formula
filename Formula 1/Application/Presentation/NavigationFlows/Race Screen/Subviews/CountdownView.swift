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
            TimeView(imageName: "timeSquare", count: days, label: "дней")
            TimeView(imageName: "timeSquare", count: hours, label: "часов")
            TimeView(imageName: "timeSquare", count: minutes, label: "минут")
        }
        .frame(height: 90)
        .padding(.top, 18)
        .padding(.horizontal, 66)
    }
}

struct TimeView: View {
    var imageName: String
    var count: Int
    var label: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .overlay(
                    Text("\(count)")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                )
            Text(label)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .light))
                .padding(.top, 4)
        }
    }
}
