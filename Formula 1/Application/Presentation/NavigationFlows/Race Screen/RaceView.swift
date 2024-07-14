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
                    
                    RaceInfoView(date: "\(viewModel.dateStart) - \(viewModel.dateEnd)")
                    
                    CountdownView()
                    
                    PracticeTimetable()
                    
                    RaceTimetable()
                }
                
            }
            .clipped()
            .onAppear {
                //viewModel.fetch()
            }
        }
    }
}
