//
//  StopwatchViewModel.swift
//  StopwatchApp
//
//  Created by 高橋直斗 on 2025/08/05.
//

import Foundation

class StopwatchViewModel: ObservableObject {
    @Published var stopwatch = Stopwatch(time: 0)
    @Published var isRunning = false
    
    private var timer: Timer?
    
    // タイマーをスタートさせる関数。すでに動いていれば処理はなし。
    func start() {
        guard !isRunning else { return }
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.stopwatch.time += 0.1
        }
    }
    
    // タイマーをストップさせる関数。
    func stop() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    // タイマーをリセットさせる関数。
    func reset() {
        stop()
        stopwatch.time = 0
    }
    
    // 表示のための関数
    func formattedTime() -> String {
        String(format: "%.1f", stopwatch.time)
    }
}
