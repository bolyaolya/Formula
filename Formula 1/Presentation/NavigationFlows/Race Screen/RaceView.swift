//
//  RaceView.swift
//  Formula 1
//
//  Created by Olya B on 17.05.2024.
//

import SwiftUI

struct RaceView<ViewModel>: View where ViewModel: RaceViewModel {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color(.darkColor)
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                
                VStack(spacing: 17) {
                    Text("Следующий этап")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                    
                    Text("17 июля - 18 июля")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .padding(.top, 15)
                    
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
                    
                    CountdownView()
                    
                    PracticeTimetable()
                    
                    RaceTimetable()
                }
                
            }
            .clipped()
        }
    }
}
