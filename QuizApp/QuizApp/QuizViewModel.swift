//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by 高橋直斗 on 2025/08/03.
//

import SwiftUI
import SwiftUI

// ObservableObjectとPublishedはセット！
class QuizViewModel: ObservableObject {
    // 問題、選択肢、答えの状態を3つ準備。それぞれQuiz.swiftでモデルとして準備してある。
    @Published var quizzes: [Quiz] = [
        Quiz(question: "SwiftUIで使うUIフレームワークは？", choices: ["UIKit", "SwiftUI", "React"], answer: "SwiftUI"),
        Quiz(question: "iOSアプリの開発言語は？", choices: ["Python", "Swift", "Java"], answer: "Swift"),
        Quiz(question: "Xcodeとは？", choices: ["猫", "統合開発環境", "犬"], answer: "統合開発環境")
    ]
    
    // 各種状態
    @Published var currentIndex = 0 // 今何問目？？の状態
    @Published var isAnswered = false // 問題に回答したかどうかの状態。falseは未回答。
    @Published var resultMessage = "" // 回答後のメッセージ。空欄の状態。正解か不正解かによって異なる。
    
    // computed propertyという計算プロパティ。
    var currentQuiz: Quiz {
        quizzes[currentIndex]
    }
    
    // 正解かどうかを判定する関数。ユーザーが選んだ選択肢が引数としてセットされる。
    func checkAnswer(_ choice: String) {
        guard !isAnswered else { return }
        isAnswered = true
        if choice == currentQuiz.answer {
            resultMessage = "正解にゃ〜！"
        } else {
            resultMessage = "残念・・・😸"
        }
    }
    
    // 次の問題に進むかどうかの関数。
    func nextQuestion() {
        if currentIndex < quizzes.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        isAnswered = false
        resultMessage = ""
    }
}
