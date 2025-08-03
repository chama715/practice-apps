//
//  ContentView.swift
//  TodoListAppApp
//
//  Created by 高橋直斗 on 2025/08/03.
//

import SwiftUI

struct ContentView: View {
    @State private var itemText = ""
    @State private var items: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("商品名を入力", text: $itemText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("追加") {
                        if !itemText.isEmpty {
                            items.append(itemText)
                            itemText = ""
                        }
                    }
                }
                .padding()
                
                List {
                    ForEach(items, id: \.self) { item in
                    Text(item)
                    }
                    .onDelete(perform: deleteItem)
                }
            }
            .navigationTitle("お買い物リスト")
        }
    }
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
