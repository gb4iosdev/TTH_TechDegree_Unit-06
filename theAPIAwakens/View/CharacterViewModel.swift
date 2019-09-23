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
    let birthPlace: URL
    let height: String
    let eyeColour: String
    let hairColour: String
    let url: URL
    let vehiclesPiloted: [String]
    //let starshipsPiloted: [String]
    
    init(from character: Character) {
        
        name = character.name
        birthyear = character.birthYear
        //birthPlace = character.homeWorld.name
        birthPlace = character.homeworldURL
        if let height = character.height {
            self.height = String(height) + "m"  //Need Conversion here
        } else {
            self.height = "Unknown"
        }
        
        eyeColour = character.eyeColour
        hairColour = character.hairColour
        url = character.url
        vehiclesPiloted = character.vehiclesPiloted.map { $0.absoluteString }
        //starshipsPiloted = character.starshipsPiloted.map { $0.name }
    }
}

