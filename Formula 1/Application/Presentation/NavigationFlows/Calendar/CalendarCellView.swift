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
        HStack {
            VStack(alignment: .leading) {
                Text(raceNumber).underline()
                    .font(.system(size: 25, weight: .bold))
                
                Spacer()
                
                Text(countryName)
                
                Text("Трасса: \(trackName)")
            }
            
            Spacer()
            
            VStack {
                Image(uiImage: trackScheme)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 113)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 8)
        .background(Color.bubbleBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.vertical, 8)
        .foregroundStyle(Color.white)
    }
}
