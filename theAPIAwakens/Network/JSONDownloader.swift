//
//  JSONDownloader.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 18-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import Foundation

class JSONDownloader {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias JSON = [String:AnyObject]
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping (JSON?, SWAPIError?) -> Void) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {    //Potential Happy Path
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON
                        completion(json, nil)
                    } catch {
                        completion(nil, .jsonParsingFailure)
                    }
                } else {
                    completion(nil, .invalidData)       //Highly unlikely to execute this
                }
            } else {
                completion(nil, .responseUnsuccessful(statusCode: httpResponse.statusCode))
            }
            
        }
        return task
    }
}
