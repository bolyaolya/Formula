//
//  CalendarCellView.swift
//  Formula 1
//
//  Created by Olya Boyko on 25.07.2024.
//

import SwiftUI

struct CalendarCellView: View {
    var raceNumber: String
    var trackScheme: UIImage    
    var countryName: String
    var trackName: String
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(raceNumber).underline()
                    .foregroundStyle(Color.white)
                
                Spacer()
                
                Image(uiImage: trackScheme)
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 75)
            }
            
            Text(countryName)
                .foregroundStyle(Color.white)
            
            Text("Трасса: \(trackName)")
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 8)
        .background(Color.bubbleBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.top, 24)
    }
}
