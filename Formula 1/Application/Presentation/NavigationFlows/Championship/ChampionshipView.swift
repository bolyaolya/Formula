//
//  ChampionshipView.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import SwiftUI

struct ChampionshipView<ViewModel>: View where ViewModel: ChampionshipViewModel {    
    @StateObject var viewModel: ViewModel
    @State private var selectedSegment: Int = 0
    
    var body: some View {
        ZStack {
            Color(.darkColor)
                .ignoresSafeArea()
            
            if viewModel.isLoading {
                CustomProgressView()
            } else {
                ScrollView(.vertical) {
                    VStack(spacing: 8) {
                        Text("Чемпионат")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        
                        CustomDivider()
                        
                        HStack {
                            SegmentButton(title: "Личный зачет", isSelected: selectedSegment == 0) {
                                selectedSegment = 0
                            }
                            SegmentButton(title: "Кубок конструктора", isSelected: selectedSegment == 1) {
                                selectedSegment = 1
                            }
                        }
                        .padding()
                        
                        if selectedSegment == 0 {
                            ForEach(viewModel.drivers) { driver in
                                DriversChampionshipView(
                                    championshipPlace: driver.position,
                                    nameSurname: "\(driver.driver.givenName) \(driver.driver.familyName)",
                                    points: driver.points,
                                    team: driver.constructors.first?.name ?? "", 
                                    image: viewModel.driverPhotos[driver.driver.driverID] ?? UIImage(systemName: "person.fill")
                                )
                            }
                        } else {
                            ConstructorsChampionshipView()
                        }
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                }
                .clipped()
            }
        }
    }
}
