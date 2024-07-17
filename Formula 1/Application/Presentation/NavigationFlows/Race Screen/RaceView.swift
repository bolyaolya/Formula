//
//  RaceView.swift
//  Formula 1
//
//  Created by Olya B on 17.05.2024.
//

import SwiftUI

struct RaceView<ViewModel>: View where ViewModel: RaceViewModel {
    
    @StateObject var viewModel: ViewModel
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            Color(.darkColor)
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(spacing: 17) {
                    
                    RaceInfoView(date: "\(viewModel.dateStart) - \(viewModel.dateEnd)", 
                                 raceName: viewModel.raceName, 
                                 countryFlag: viewModel.countryFlag)
                    
                    CountdownView(days: viewModel.daysLeft, 
                                  hours: viewModel.hoursLeft,
                                  minutes: viewModel.minutesLeft)
                    
                    PracticeTimetable()
                    
//                   TODO: SprintTimetable()
                    
                    RaceTimetable()
                }
            }
            .clipped()
            .onAppear {
                viewModel.fetchNextRaceWeekend()
            }
            .onDisappear {
                timer?.invalidate()
            }
            .onReceive(Timer.publish(every: 60, on: .main, in: .common).autoconnect()) { _ in
                viewModel.calculateTimeUntilRaceStart()
            }
        }
    }
}
