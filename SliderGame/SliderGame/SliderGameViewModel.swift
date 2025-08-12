//
//  SliderGameViewModel.swift
//  SliderGame
//
//  Created by 高橋直斗 on 2025/08/11.
//

import Foundation

class SliderGameViewmodel: ObservableObject {
    @Published private var game = SliderGame()
    @Published var currentValue: Double = 50
    @Published var showingResult = false
    
    var target: Int { game.target }
    var totalScore: Int { game.totalScore }
    var round: Int { game.round }
    var lastPoints: Int { game.lastPoints }
 
    func hit() {
        let guess = Int(currentValue.rounded())
        let points = SliderGame.score(for: game.target, guess: guess)
        game.lastPoints = points
        game.totalScore += points
        showingResult = true
    }
    
    func nextRound() {
        game.round += 1
        game.newTarget()
        currentValue = 50
    }
    
    func restart() {
        game = SliderGame()
        currentValue = 50
        showingResult = false
    }    
}
