//
//  ButtonView.swift
//  Formula
//
//  Created by Olya Boyko on 27.08.2024.
//

import SwiftUI

struct ButtonView: View {
    var action: () -> Void
    var buttonTitle: String
    var icon: String
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(buttonTitle)
                    .foregroundStyle(Color.white)
                
                Spacer()
                
                Image(systemName: icon)
                    .foregroundStyle(Color.white)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 14)
        .background(Color.bubbleBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
