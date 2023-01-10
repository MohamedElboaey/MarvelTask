//
//  Thumbnail.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 09/01/2023.
//

import Foundation

struct Thumbnail: Decodable {
    let path: String
    let ext: String
    
    var url: String {
        return path + "." + ext
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
        
    }
    
    init(path: String, ext: String) {
        self.path = path
        self.ext = ext
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let path: String = try container.decode(String.self, forKey: .path)
        let ext: String = try container.decode(String.self, forKey: .ext)
        
        self.init(path: path, ext: ext)
    }
    
}
