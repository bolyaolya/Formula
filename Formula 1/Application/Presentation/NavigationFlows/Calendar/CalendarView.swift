//
//  CalendarView.swift
//  Formula 1
//
//  Created by Olya Boyko on 22.07.2024.
//

import SwiftUI

struct CalendarView<ViewModel>: View where ViewModel: CalendarViewModel {    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color(.darkColor)
                .ignoresSafeArea()
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
                    .padding()
                    .tint(Color(.white))
            } else {
                ScrollView(.vertical) {
                    VStack(spacing: 8) {
                        Text("Календарь")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        
                        CustomDivider()
                        
                        CalendarCellView(raceNumber: viewModel.round,
                                         trackScheme: viewModel.trackScheme,
                                         countryName: viewModel.countryName,
                                         trackName: viewModel.trackName)
                    }
                }
                .clipped()
            }
        }
    }
}
