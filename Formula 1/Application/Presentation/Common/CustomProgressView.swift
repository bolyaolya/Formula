//
//  CustomProgressView.swift
//  Formula 1
//
//  Created by Olya Boyko on 15.08.2024.
//

import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .scaleEffect(1.5)
            .padding()
            .tint(Color.white)
    }
}
