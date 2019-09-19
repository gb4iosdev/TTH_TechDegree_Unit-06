//
//  CharacterViewModel.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 16-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import Foundation

struct CharacterViewModel {
    
    let name: String
    let birthyear: String
    let birthPlace: String
    let height: String
    let eyeColour: String
    let hairColour: String
    let vehiclesPiloted: [String]
    let starshipsPiloted: [String]
    
    init(using character: Character) {
        
        name = character.name
        birthyear = character.birthyear
        birthPlace = character.homeWorld.name
        height = String(character.height) + "m"  //Need Conversion here
        eyeColour = character.eyeColour
        hairColour = character.hairColour
        vehiclesPiloted = character.vehiclesPiloted.map { $0.name }
        starshipsPiloted = character.starshipsPiloted.map { $0.name }
    }
}
