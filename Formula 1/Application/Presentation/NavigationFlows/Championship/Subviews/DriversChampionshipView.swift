//
//  DriversChampionshipView.swift
//  Formula 1
//
//  Created by Olya Boyko on 19.07.2024.
//

import SwiftUI

struct DriversChampionshipView: View {
    var championshipPlace: String
    var nameSurname: String
    var points: String
    var team: String
    var image: UIImage?
    
    private var pointsText: String {
        let ending = LocalizationHelper().correctEnding(for: points)
        return "\(points) \(ending)"
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(championshipPlace)
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(nameSurname)
                    .font(.title2)
                    .foregroundColor(.white)
                
                Text(team)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            ZStack(alignment: .bottom) {
                if let image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.6), .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .frame(width: 120, height: 120)
                    .clipShape(Rectangle())
                    .cornerRadius(8)
                }
                
                Text(pointsText)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: 140)
        .background(Color.bubbleBackground)
        .cornerRadius(16)
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
    }
}
