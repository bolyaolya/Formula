//
//  ChampionshipView.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import SwiftUI

struct ChampionshipView<ViewModel>: View where ViewModel: ChampionshipViewModel {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color(.darkColor)
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                
            }
            .clipped()
        }
    }
}
