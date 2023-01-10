//
//  APIClient.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 08/01/2023.
//

import Foundation
import Alamofire

class APIClient {
    func request<T: Decodable>(
        url: String,
        completionHandler: @escaping (T) -> Void){
            AF.request(url).responseData { (response) in
                switch response.result {
                case .success:
                    do {
                        guard let data = response.value else {return}
                        let object = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(object)
                    } catch {
                        return
                    }
                case let .failure(error):
                    print(error)
                }
            }
        }
}
