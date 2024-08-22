//
//  PracticeView.swift
//  Formula
//
//  Created by Olya Boyko on 22.08.2024.
//

import SwiftUI

struct PracticeView: View {
    var label: String
    var day: String
    var time: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .regular))
                .padding(.leading, 10)
            
            Spacer()
            
            Text(day)
                .foregroundColor(.white.opacity(0.8))
                .font(.system(size: 16, weight: .light))
                .padding(.trailing, 25)
            
            Text(time)
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .semibold))
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.trailing, 10)
        }
    }
}

