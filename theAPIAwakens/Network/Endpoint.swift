//
//  Endpoint.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 20-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import Foundation

//This type deals with constructing the URL (API end point)
enum Endpoint: String {
    case character = "people/1/"
    case vehicle = "vehicles/14/"
    case people = "people/"
    case peopleLastPage = "people/?page=9"
    
    func fullURL() -> URL? {
        let base = "https://swapi.co/api/"
        switch self {
        case .character: return URL(string: base + self.rawValue)
        case .vehicle: return URL(string: base + self.rawValue)
        case .people: return URL(string: base + self.rawValue)
        case .peopleLastPage: return URL(string: base + self.rawValue)
        }
    }
}
