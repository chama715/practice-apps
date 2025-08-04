//
//  QuizView.swift
//  QuizApp
//
//  Created by 高橋直斗 on 2025/08/03.
//

import SwiftUI

struct QuizView: View {
    // 裏のviewModelと一心同体！
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            // 今の問題文を表示。
            Text(viewModel.currentQuiz.question)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            // 選択肢を1つずつ出してボタンとして表示。
            ForEach(viewModel.currentQuiz.choices, id: \.self) { choice in
                Button(action: {
                    viewModel.checkAnswer(choice) // ボタンをタップしたら、正誤の判定を行う。
                }) {
                    Text(choice)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(viewModel.isAnswered) // すでにタップしたボタンは押せなくなる。
            }
            // もし問題に答えていたら、次の問題へ進むテキストを表示。
            if viewModel.isAnswered {
                Text(viewModel.resultMessage)
                    .font(.title2)
                    .foregroundColor(viewModel.resultMessage == "正解にゃ〜！" ? .green : .red)
                
                // 次の問題へ進む
                Button("次の問題へ") {
                    viewModel.nextQuestion()
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}
