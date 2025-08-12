//
//  SliderGameView.swift
//  SliderGame
//
//  Created by 高橋直斗 on 2025/08/11.
//

import SwiftUI

struct SliderGameView: View {
    @StateObject private var viewModel = SliderGameViewmodel()
    
    var body: some View {
        VStack(spacing: 24) {
            Text("目標値: \(viewModel.target)")
                .font(.title)
            
            Text("現在値: \(Int(viewModel.currentValue.rounded()))")
                .font(.headline)
            
            Slider(value: $viewModel.currentValue, in: 1...100, step: 1)
            
            Button("Hit me!!") {
                viewModel.hit()
            }
            .buttonStyle(.borderedProminent)
            
            HStack {
                Text("合計: \(viewModel.totalScore)")
                Spacer()
                Text("ラウンド: \(viewModel.round)")
            }
            .font(.subheadline)
        }
        .padding()
        .alert("結果", isPresented: $viewModel.showingResult) {
            Button("次のラウンドへ") {
                viewModel.nextRound()
            }
            Button("リスタート", role: .destructive) {
                viewModel.restart()
            }
        } message: {
            Text("得点: \(viewModel.lastPoints) 点！")
        }
    }
}

#Preview {
    SliderGameView()
}
