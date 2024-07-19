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
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
                    .padding()
                    .tint(Color(.white))
            } else {
                ScrollView(.vertical) {
                    VStack(spacing: 17) {
                        
                        RaceInfoView(date: "\(viewModel.dateStart) - \(viewModel.dateEnd)",
                                     raceName: viewModel.raceName,
                                     countryFlag: viewModel.countryFlag)
                        
                        CountdownView(days: viewModel.daysLeft,
                                      hours: viewModel.hoursLeft,
                                      minutes: viewModel.minutesLeft)
                        
                        PracticeTimetableView(firstPracticeDate: viewModel.firstPracticeDate,
                                          secondPracticeDate: viewModel.secondPracticeDate,
                                          thirdPracticeDate: viewModel.thirdPracticeDate,
                                          firstPracticeTime: viewModel.firstPracticeScreenTime,
                                          secondPracticeTime: viewModel.secondPracticeScreenTime,
                                          thirdPracticeTime: viewModel.thirdPracticeScreenTime)
                        
                        if let sprintDate = viewModel.sprintDate,
                            let sprintTime = viewModel.sprintTime,
                           let sprintQualyDate = viewModel.sprintQualyDate,
                           let sprintQualyTime = viewModel.sprintQualyTime {
                            SprintTimetableView(sprintQualyDate: sprintQualyDate,
                                                sprintQualyTime: sprintQualyTime,
                                                sprintDate: sprintDate, sprintTime: sprintTime)
                        }
                        
                        RaceTimetableView(qualyDate: viewModel.qualyDate,
                                      raceDate: viewModel.raceDate,
                                      qualyTime: viewModel.qualyTime,
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
