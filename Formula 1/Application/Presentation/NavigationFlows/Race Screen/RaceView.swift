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
            
            if viewModel.isLoading {
                CustomProgressView()
            } else {
                ScrollView(.vertical) {
                    VStack(spacing: 17) {                        
                        Text("Следующий этап")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        
                        CustomDivider()
                        
                        RaceInfoView(date: "\(viewModel.dateStart) - \(viewModel.dateEnd)",
                                     raceName: viewModel.raceName,
                                     countryFlag: viewModel.countryFlag)
                        
                        CountdownView(days: viewModel.daysLeft,
                                      hours: viewModel.hoursLeft,
                                      minutes: viewModel.minutesLeft)
                        
                        PracticeTimetableView(firstPracticeDate: viewModel.firstPracticeDate,
                                          secondPracticeDate: viewModel.secondPracticeDate,
                                          thirdPracticeDate: viewModel.thirdPracticeDate,
                                          firstPracticeTime: viewModel.firstPracticeTime,
                                          secondPracticeTime: viewModel.secondPracticeTime,
                                          thirdPracticeTime: viewModel.thirdPracticeTime)
                        
                        if let sprintDate = viewModel.sprintDate,
                            let sprintTime = viewModel.sprintTime,
                           let sprintQualyDate = viewModel.sprintQualificationDate,
                           let sprintQualyTime = viewModel.sprintQualificationTime {
                            SprintTimetableView(sprintQualyDate: sprintQualyDate,
                                                sprintQualyTime: sprintQualyTime,
                                                sprintDate: sprintDate, sprintTime: sprintTime)
                        }
                        
                        RaceTimetableView(qualyDate: viewModel.qualificationDate,
                                      raceDate: viewModel.raceDate,
                                      qualyTime: viewModel.qualificationTime,
                                      raceTime: viewModel.raceTime)
                    }
                }
                .clipped()
                
                .onDisappear {
                    timer?.invalidate()
                }
                .onReceive(Timer.publish(every: 60, on: .main, in: .common).autoconnect()) { _ in
                    viewModel.calculateTimeUntilRaceStart()
                }
            }
        }
    }
}
