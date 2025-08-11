struct Cat {
    
    // プロパティ
    var name: String
    var age: Int
    var favoriteToy: String
    
    // イニシャライザ
    init(name: String, age: Int, favoriteToy: String = "ねずみのおもちゃ") {
        self.name = name
        self.age = age
        self.favoriteToy = favoriteToy
    }
    
    // メソッド
    func introduce() -> String {
        "にゃーん！僕は\(name)、\(age)歳。好きなおもちゃは\(favoriteToy)だよ！"
    }
    
    // 年齢を1つ増やす
    mutating func haveBirthday() {
        age += 1
    }
}

var chama = Cat(name: "ちゃま君", age: 32)

print(chama.introduce())

chama.haveBirthday()
print(chama.introduce())

let yoshio = Cat(name: "よしお", age: 3, favoriteToy: "ダンボール")
print(yoshio.introduce())



