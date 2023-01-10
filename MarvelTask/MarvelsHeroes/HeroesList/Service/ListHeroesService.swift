//
//  HeroesListService.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 09/01/2023.
//

import UIKit

final public class HeroesListService {
    //MARK: - Variables
    private let endpoint: Endpoint
    private let apiClient: APIClient
    private let itensLimit = 50
    
    init(endpoint: Endpoint = Endpoint(),
         apiClient: APIClient = APIClient()) {
        self.endpoint = endpoint
        self.apiClient = apiClient
    }
    //MARK: - API request
    func loadHeroes(
        currentPage: Int,
        completionHandler: @escaping (HeroInfo) -> Void
    ) {
        let offset = currentPage * itensLimit
        let parameters = "characters?" + "offset=\(offset)&limit=\(itensLimit)&"
        let url = endpoint.createEndpoint(parameters: parameters)
        
        apiClient.request(url: url) { (result: HeroInfo) in
            completionHandler(result)
        }
    }
    func searchHeroes(
        heroName: String,
        completionHandler: @escaping (HeroInfo) -> Void
    ) {
        let parameters = "characters?" + "nameStartsWith=\(heroName)&"
        let url = endpoint.createEndpoint(parameters: parameters)
        apiClient.request(url: url) { (result: HeroInfo) in
            completionHandler(result)
        }
    }
}
