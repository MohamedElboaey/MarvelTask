//
//  Endpoint.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 08/01/2023.
//

import SwiftHash
import Foundation

class Endpoint {
    //MARK: - Constants Variables
    private let basePath = "https://gateway.marvel.com/v1/public/"
    private let publicKey = "056656da446526ef1ebaabef6c7552b5"
    private let privateKey = "7c2a4680db5483612884811a27b56361cf9ccd81"
    //MARK: - Create the Endpoints
    func createEndpoint(parameters: String) -> String {
        let url = basePath + parameters + getCredentials()
        return url
    }
    private func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
    
    
}
