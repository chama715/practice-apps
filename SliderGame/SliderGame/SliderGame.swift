//
//  SliderGame.swift
//  SliderGame
//
//  Created by 高橋直斗 on 2025/08/11.
//

import Foundation

struct SliderGame {
    var target: Int = Int.random(in: 1...10)
    var totalScore: Int = 0
    var round: Int = 1
    var lastPoints: Int = 0
    
    mutating func newTarget() {
        target = Int.random(in: 1...100)
    }
    
    static func score(for target: Int, guess: Int) -> Int {
        let diff = abs(target - guess)
        let base = max(0, 100 - diff)
        let bonus = (diff == 0) ? 50 : (diff <= 2 ? 25 : 0)
        return base + bonus
    }
}
