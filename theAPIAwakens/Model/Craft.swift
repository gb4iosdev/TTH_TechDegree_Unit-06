//
//  Craft.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 16-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import Foundation

protocol Craft {
    var name: String { get }
    var make: String { get }
    var cost: Int { get }
    var length: Double { get }
    var craftClass: String { get }
    var crewCapacity: Int { get }
    var craftType: CraftType { get }
    var url: URL { get }                     //Could also act as a unique ID for the character
    
    func fetchDetail()
}

