//
//  CalendarView.swift
//  Formula 1
//
//  Created by Olya Boyko on 22.07.2024.
//

import SwiftUI

struct CalendarView<ViewModel>: View where ViewModel: ICalendarViewModel {    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color(.darkColor)
                .ignoresSafeArea()
            
            if viewModel.isLoading {
                CustomProgressView()
            } else {
                ScrollView(.vertical) {
                    VStack(spacing: 8) {
                        Text("Календарь")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        
                        CustomDivider()
                            .padding(.bottom, 15)
                        
                        ForEach(viewModel.races, id: \.round) { race in
                            CalendarCellView(raceNumber: race.round,
                                             trackScheme: viewModel.trackSchemes[race.circuit.circuitID] ?? UIImage(),
                                             countryName: RaceLocalization.localizedRaceName(for: race.raceName),
                                             trackName: race.circuit.location.locality)
                        }
                        .padding(.horizontal, 16)
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                }
                .clipped()
            }
        }
    }
}
