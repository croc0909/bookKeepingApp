//
//  Lover.swift
//  bookKeepingApp
//
//  Created by AndyLin林棋瀚 on 2023/4/24.
//

import Foundation

struct Lover: Codable {
    var name:String
    var star: String
    // 圖片
    var imageName: String?
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

    
    static func loadLovers() -> Lover? {
        let url = documentsDirectory.appendingPathComponent("lover")
        guard let data = try? Data(contentsOf: url) else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(Lover.self, from: data)
    }
    
    static func saveLovers(_ lovers: Self) {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(lovers) else { return }
        let url = documentsDirectory.appendingPathComponent("lover")
        try? data.write(to: url)
    }
}
