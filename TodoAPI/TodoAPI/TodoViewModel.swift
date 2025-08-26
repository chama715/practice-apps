//
//  TodoViewModel.swift
//  TodoAPI
//
//  Created by 高橋直斗 on 2025/08/15.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var isLoading = false
    
    func fetchTodos() {
        guard !isLoading else { return }
        isLoading = true
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            print("URLが間違っています")
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                self.isLoading = false
                
                guard let data = data, error == nil else {
                    print("データの取得に失敗しました。: \(error?.localizedDescription ?? "不明なエラー")")
                    return
                }
                
                do {
                    let decodedTodos = try JSONDecoder().decode([Todo].self, from: data)
                    
                    self.todos = decodedTodos
                    print("Todoデータを\(decodedTodos.count)件取得成功！")
                } catch {
                    print("JSONのデコードに失敗しました。: \(error)")
                }
            }
        }.resume()
    }
}
