//
//  StopwatchView.swift
//  StopwatchApp
//
//  Created by 高橋直斗 on 2025/08/05.
//

import SwiftUI

struct StopwatchView: View {
    @StateObject private var viewModel = StopwatchViewModel()
    
    var body: some View {
        VStack(spacing:20) {
            Text(viewModel.formattedTime())
                .font(.system(size: 60, weight: .bold, design: .monospaced))
                .padding()
            
            HStack(spacing:20) {
                Button(action: {
                    viewModel.start()
                }) {
                    Text("スタートにゃ😸")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    viewModel.stop()
                }) {
                    Text("ストップにゃ😻")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    viewModel.reset()
                }) {
                    Text("リセットにゃ😺")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
