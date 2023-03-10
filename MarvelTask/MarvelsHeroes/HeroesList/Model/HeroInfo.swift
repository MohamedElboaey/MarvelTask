//
//  HeroInfo.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 09/01/2023.
//

import Foundation

struct HeroInfo: Decodable {
    let code: Int
    let status: String
    let data: HeroData
    
    enum CodingKeys: String, CodingKey {
        case code
        case status
        case data
    }
    
    init(code: Int, status: String, data: HeroData) {
        self.code = code
        self.status = status
        self.data = data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let code: Int = try container.decode(Int.self, forKey: .code)
        let status: String = try container.decode(String.self, forKey: .status)
        let data: HeroData = try container.decode(HeroData.self, forKey: .data)
        
        self.init(code: code, status: status, data: data)
    }
}
