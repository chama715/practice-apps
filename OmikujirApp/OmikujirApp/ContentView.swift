//
//  ContentView.swift
//  OmikujirApp
//
//  Created by 高橋直斗 on 2025/08/02.
//

import SwiftUI

struct ContentView: View {
    @State private var result = "今日の運勢は？？"
    let fortunes = ["大吉","中吉","直吉","末吉","凶","大凶"]
    
    var body: some View {
        // spacing40は、各要素間に40ptの余白をつけると言う意味
        VStack(spacing: 40) {
            Text(result)
                .font(.largeTitle)
                .padding()
            
            Button("おみくじを引く") {
                let randomIndex = Int.random(in: 0..<fortunes.count)
                result = fortunes[randomIndex]
            }
            .font(.title)
            .padding()
            .background(Color.pink.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
