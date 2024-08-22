//
//  TimeView.swift
//  Formula
//
//  Created by Olya Boyko on 22.08.2024.
//

import SwiftUI

struct TimeView: View {
    var imageName: String
    var count: Int
    var labelKey: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .overlay(
                    Text("\(count)")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                )
            Text(LocalizationHelper().localizedStringForKey(labelKey, count: count))
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .light))
                .padding(.top, 4)
        }
    }
}
