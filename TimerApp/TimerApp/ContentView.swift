//
//  ContentView.swift
//  TimerApp
//
//  Created by 高橋直斗 on 2025/08/03.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "スタートを押してにゃ〜😸"
    
    var body: some View {
        VStack(spacing:40) {
            Text(message)
                .font(.largeTitle)
                .padding()
            
            Button("スタート") {
                message = "カウントちゆう😻"
                Timer.scheduledTimer(withTimeInterval: 3.0,repeats: false) { _ in
                    message = "完了なり〜〜！"
                }
            }
            .font(.title)
            .padding()
            .background(Color.blue.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
