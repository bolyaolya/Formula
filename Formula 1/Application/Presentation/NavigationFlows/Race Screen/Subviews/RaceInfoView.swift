//
//  RaceInfoView.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import SwiftUI

struct RaceInfoView: View {
    
    var date: String
    
    var body: some View {
        VStack {
            Text("Следующий этап")
                .foregroundStyle(Color.white)
                .font(.system(size: 34))
                .fontWeight(.bold)
            
            Text("\(date)")
                .foregroundColor(.white)
                .font(.system(size: 18))
                .padding(.top, 3)
            
            HStack {
                Image("italy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 98, height: 65)
                    .padding(.leading, 39)
                
                VStack(alignment: .center, spacing: 8) {
                    Text("ГРАН ПРИ")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                    Text("ЭМИЛИИ-РОМАНЬИ")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                }
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
