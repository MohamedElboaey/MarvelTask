//
//  Hero.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 09/01/2023.
//


import Foundation


struct Hero: Decodable {
    
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
    }
    
    init(id: Int, name: String, description: String, thumbnail: Thumbnail) {
        
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id: Int = try container.decode(Int.self, forKey: .id)
        let name: String = try container.decode(String.self, forKey: .name)
        let description: String = try container.decode(String.self, forKey: .description)
        let thumbnail: Thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)

        self.init(id: id, name: name, description: description, thumbnail: thumbnail)
    }
    
}


