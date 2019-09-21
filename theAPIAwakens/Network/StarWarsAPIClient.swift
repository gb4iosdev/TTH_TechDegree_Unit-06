//
//  StarWarsAPIClient.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 20-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import Foundation

class StarWarsAPIClient {
    
    lazy var starWarsBaseURL: URL = {
        return URL(string: "https://swapi.co/api/")!
    }()
    
    let downloader = JSONDownloader()
    
    typealias StarWarsDataCompletionHandler = (Character?, StarWarsAPIError?) -> Void
    
    func getStarWarsData(for endpoint: Endpoint, completionHandler completion: @escaping StarWarsDataCompletionHandler) {
        
        guard let starWarsFullURL = URL(string: endpoint.rawValue, relativeTo: starWarsBaseURL) else {
            completion(nil, .invalidURL)
            return
        }
        
        let request = URLRequest(url: starWarsFullURL)
        
        let task = downloader.jsonTask(with: request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                
                guard let character = Character(json: json) else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                
                completion(character, nil)
            }
        }
        
        task.resume()
    }
    
}
