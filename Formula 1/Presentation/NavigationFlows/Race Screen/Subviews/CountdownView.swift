//
//  CountdownView.swift
//  Formula 1
//
//  Created by Olya B on 23.05.2024.
//

import SwiftUI

struct CountdownView: View {
    
    var body: some View {
        HStack(spacing: 30) {
            TimeView(imageName: "timeSquare", count: "00", label: "дней")
            TimeView(imageName: "timeSquare", count: "00", label: "часов")
            TimeView(imageName: "timeSquare", count: "00", label: "минут")
        }
        .frame(height: 90)
        .padding(.top, 18)
        .padding(.horizontal, 66)
    }
}

struct TimeView: View {
    var imageName: String
    var count: String
    var label: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .overlay(
                    Text(count)
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

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
