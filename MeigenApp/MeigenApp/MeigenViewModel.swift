//
//  MeigenViewModel.swift
//  MeigenApp
//
//  Created by 高橋直斗 on 2025/08/04.
//

import Foundation

class MeigenViewModel: ObservableObject {
    @Published var currentMeigen: Meigen
    
    private let meigens: [Meigen] = [
        Meigen(text: "成功するために1番大事なことは、行動することだ", author: "スティーブ・ジョブズ"),
        Meigen(text: "PKを外すことができるのは、PKを蹴る勇気を持った者だけだ。", author: "ロベルト・バッジョ"),
        Meigen(text: "猫は最高の生き物", author: "ちゃま"),
        Meigen(text: "自分を信じて前に進め！", author: "にゃんこ先生")
    ]
    
    init() {
        self.currentMeigen = meigens.randomElement()!
    }
    
    func getMeigen() {
        currentMeigen = meigens.randomElement()!
    }
}
