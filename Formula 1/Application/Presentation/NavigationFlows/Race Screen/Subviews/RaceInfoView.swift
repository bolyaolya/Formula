//
//  RaceInfoView.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import SwiftUI

struct RaceInfoView: View {
    
    var date: String
    var raceName: String
    var countryFlag: UIImage
    
    var body: some View {
        VStack {
            Text("Следующий этап")
                .foregroundStyle(Color.white)
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            CustomDivider()
            
            Text(raceName.uppercased())
                .foregroundColor(.white)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
            
            HStack {
                Image(uiImage: countryFlag)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 70)
                    .padding(.leading, 25)
                
                Text(date)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .padding(.leading, 12)
                    .padding(.trailing, 10)
            }
            
            Text("До старта гонки:")
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .bold))
        }
        .padding(.top, 14)
    }
}
