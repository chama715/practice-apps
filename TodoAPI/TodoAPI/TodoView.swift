//
//  Todo.swift
//  TodoAPI
//
//  Created by 高橋直斗 on 2025/08/15.
//

import SwiftUI

struct TodoView: View {
    @StateObject private var viewModel = TodoViewModel()

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("読み込み中にゃ...")
            } else {
                List(viewModel.todos) { todo in
                    HStack {
                        Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(todo.completed ? .green : .primary)
                        
                        Text(todo.title)
                            .strikethrough(todo.completed, color: .primary)
                    }
                }
                .navigationTitle("みんなのToDoリスト")
            }
        }
        .onAppear {
            viewModel.fetchTodos()
        }
    }
}

#Preview {
    TodoView()
}
