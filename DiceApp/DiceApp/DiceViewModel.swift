//
//  DiceViewModel.swift
//  DiceApp
//
//  Created by 高橋直斗 on 2025/08/05.
//

import Foundation

class DiceViewModel: ObservableObject {
    @Published var diceNumber = 1
    
    // サイコロを振るための関数
    func rollDice() {
        diceNumber = Int.random(in: 1...6)
    }
}
