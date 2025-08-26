//
//  Todo.swift
//  TodoAPI
//
//  Created by 高橋直斗 on 2025/08/15.
//

/*
 モデル。勝利の方程式の１。
 ドキュメントとかを読んで、どんなプロパティを作ったらいいのかを調べて書く。
 
 */

import Foundation

struct Todo: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
