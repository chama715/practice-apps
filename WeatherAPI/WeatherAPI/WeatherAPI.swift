//
//  WeatherAPI.swift
//  WeatherAPI
//
//  Created by 高橋直斗 on 2025/08/29.
//

import Foundation

// MARK: - APIから受け取るJSON全体の構造の定義
struct WeatherResponse: Decodable {
    let name: String // 都市名
    let main: Main // 気温
    let weather: [Weather] // 天気情報
}

// MARK: - mainプロパティの中のJSON構造
struct Main: Decodable {
    let temp: Double
}

// MARK: - weatherプロパティの中のJSON構造
struct Weather: Decodable {
    let description: String
}
