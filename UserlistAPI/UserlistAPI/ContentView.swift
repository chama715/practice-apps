//
//  ContentView.swift
//  UserlistAPI
//
//  Created by 高橋直斗 on 2025/08/16.
//

import SwiftUI

// MARK: - Model

struct User: Codable, Identifiable {
    
    let id: Int
    let name: String
    let username: String
    let email: String
    
}

// MARK: - ViewModel

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var isLoading = false
    
    func fetchUsers() {
        guard !isLoading else { return }
        isLoading = true
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("URLが間違っています。")
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
                    
                    let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                    
                    self.users = decodedUsers
                    print("ユーザーデータを\(decodedUsers.count)件取得成功！")
                } catch {
                    print("JSONのデコードに失敗した！")
                }
            }
        }.resume()
    }
}

// MARK: - View

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("読み込み中にゃん")
            } else {
                List(viewModel.users) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .navigationTitle("ユーザーリスト")
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

// MARK: - View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
