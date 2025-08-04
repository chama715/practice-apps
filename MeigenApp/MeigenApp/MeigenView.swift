//
//  MeigenView.swift
//  MeigenApp
//
//  Created by 高橋直斗 on 2025/08/04.
//

import SwiftUI

struct MeigenView: View {
    @StateObject private var viewModel = MeigenViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.currentMeigen.text)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("- \(viewModel.currentMeigen.author)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Button("新しい名言") {
                viewModel.getMeigen()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
