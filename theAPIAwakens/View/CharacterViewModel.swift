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
    let home: String
    let height: String
    let eyeColour: String
    let hairColour: String
    let vehiclesPiloted: [String]
    let starshipsPiloted: [String]
}

extension CharacterViewModel {
    
    init?(from character: Character) {
        
        name = character.name
        if let height = character.height {
            self.height = String(height) + "m"  //Need Conversion here
        } else {
            self.height = "Unknown"
        }
        
        if let detail = character.detail {
            self.birthyear = detail.birthYear
            self.eyeColour = detail.eyeColour
            self.hairColour = detail.hairColour
            self.home = detail.home ?? ""
            self.vehiclesPiloted = detail.vehicleNames ?? []
            self.starshipsPiloted = detail.starshipNames ?? []
        } else {
            return nil
        }
    }
}

