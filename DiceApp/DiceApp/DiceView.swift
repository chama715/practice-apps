//
//  DiceView.swift
//  DiceApp
//
//  Created by 高橋直斗 on 2025/08/05.
//

import SwiftUI

struct DiceView: View {
    @StateObject private var viewModel = DiceViewModel()
    
    var body: some View {
        VStack(spacing:30) {
            Text("サイコロの目: \(viewModel.diceNumber)")
                .font(.largeTitle)
                .bold()
            
            Image(systemName: "die.face.\(viewModel.diceNumber).fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            Button("サイコロを振る") {
                viewModel.rollDice()
            }
            .font(.title2)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
