//
//  ConstructorsChampionshipView.swift
//  Formula 1
//
//  Created by Olya Boyko on 22.07.2024.
//

import SwiftUI

struct ConstructorsChampionshipView: View {
    var championshipPlace: String
    var teamName: String
    var points: String
    var image: UIImage?
    
    private var pointsText: String {
        let ending = LocalizationHelper().correctEnding(for: points)
        return "\(points) \(ending)"
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text(championshipPlace)
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(teamName)
                    .font(.title2)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            ZStack(alignment: .bottom) {
                if let image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 180, height: 120)
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.6), .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .frame(width: 180, height: 120)
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
        .padding(.vertical, 5)
    }
}
