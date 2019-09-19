//
//  Craft.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 16-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import Foundation

protocol Craft {
    let name: String
    let make: String
    let cost: Int
    let length: Double
    let craftClass: String
    let crewCapacity: Int
    let craftType: CraftType
}
