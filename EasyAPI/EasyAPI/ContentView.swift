//
//  ContentView.swift
//  EasyAPI
//
//  Created by 高橋直斗 on 2025/08/12.
//

/*
 インターネット上にある公開サーバーからダミーの投稿データを取ってきて、そのタイトルと本文を一覧表示するAPI通信の基本を学ぶための練習アプリ
 */

import SwiftUI

// MARK: - Model
struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

// MARK: - ViewModel
class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false

    func fetchPosts() {
        guard !isLoading else { return }

        isLoading = true

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("URLが間違ってるにゃ")
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false

                guard let data = data, error == nil else {
                    print("データ取得に失敗したにゃ: \(error?.localizedDescription ?? "不明なエラー")")
                    return
                }
                
                do {
                    let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
                    self.posts = decodedPosts
                    print("投稿データを\(decodedPosts.count)件取得成功だにゃ！")
                } catch {
                    print("JSONのデコードに失敗したにゃ: \(error)")
                }
            }
        }.resume()
    }
}

// MARK: - View
struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("読み込み中にゃ...")
            } else {
                List(viewModel.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .navigationTitle("みんなの投稿")
            }
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
