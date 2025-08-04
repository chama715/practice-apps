//
//  Meigen.swift
//  MeigenApp
//
//  Created by 高橋直斗 on 2025/08/04.
//

import Foundation

// 名言構造体。ID、名言、誰か、を準備。
struct Meigen: Identifiable {
    let id = UUID()
    let text: String
    let author: String
}
