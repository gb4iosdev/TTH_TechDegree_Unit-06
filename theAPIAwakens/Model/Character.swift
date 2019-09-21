//
//  Character.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 16-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import Foundation

struct Character {
    let name: String
    let birthyear: String
    let homeWorldURL: URL
    //let homeWorld: Planet
    let height: Double
    let eyeColour: String
    let hairColour: String
    //let vehiclesPiloted: [Vehicle]
    //let starshipsPiloted: [Starship]
}

extension Character {
    struct Key {
        static let name = "name"
        static let birthyear = "birth_year"
        static let homeWorldURL = "homeworld"
        static let height = "height"
        static let eyeColour = "eye_color"
        static let hairColour = "hair_color"
        //static let vehiclesPiloted: = "vehicles"
        //static let starshipsPiloted: = "starships"
    }
    
    typealias JSON = [String:AnyObject]
    
    init?(json: JSON) {
        guard let name = json[Key.name] as? String,
        let birthyear = json[Key.birthyear] as? String,
        let homeWorldURLString = json[Key.homeWorldURL] as? String,
        let homeWorldURL = URL(string: homeWorldURLString),
        let heightString = json[Key.height] as? String,
        let height = Double(heightString),
        let eyeColour = json[Key.eyeColour] as? String,
        let hairColour = json[Key.hairColour] as? String else {
                return nil
        }
        
        self.name = name
        self.birthyear = birthyear
        self.homeWorldURL = homeWorldURL
        self.height = height
        self.eyeColour = eyeColour
        self.hairColour = hairColour
    }
}

/*Schema:
 
 {
 "title": "People",
 "required": [
 "name",
 "height",
 "mass",
 "hair_color",
 "skin_color",
 "eye_color",
 "birth_year",
 "gender",
 "homeworld",
 "films",
 "species",
 "vehicles",
 "starships",
 "url",
 "created",
 "edited"
 ],
 "properties": {
 "created": {
 "format": "date-time",
 "type": "string",
 "description": "The ISO 8601 date format of the time that this resource was created."
 },
 "eye_color": {
 "type": "string",
 "description": "The eye color of this person."
 },
 "gender": {
 "type": "string",
 "description": "The gender of this person (if known)."
 },
 "homeworld": {
 "type": "string",
 "description": "The url of the planet resource that this person was born on."
 },
 "species": {
 "type": "array",
 "description": "The url of the species resource that this person is."
 },
 "skin_color": {
 "type": "string",
 "description": "The skin color of this person."
 },
 "films": {
 "type": "array",
 "description": "An array of urls of film resources that this person has been in."
 },
 "edited": {
 "format": "date-time",
 "type": "string",
 "description": "the ISO 8601 date format of the time that this resource was edited."
 },
 "birth_year": {
 "type": "string",
 "description": "The birth year of this person. BBY (Before the Battle of Yavin) or ABY (After the Battle of Yavin)."
 },
 "mass": {
 "type": "string",
 "description": "The mass of this person in kilograms."
 },
 "name": {
 "type": "string",
 "description": "The name of this person."
 },
 "vehicles": {
 "type": "array",
 "description": "An array of vehicle resources that this person has piloted"
 },
 "url": {
 "format": "uri",
 "type": "string",
 "description": "The url of this resource"
 },
 "hair_color": {
 "type": "string",
 "description": "The hair color of this person."
 },
 "height": {
 "type": "string",
 "description": "The height of this person in meters."
 },
 "starships": {
 "type": "array",
 "description": "An array of starship resources that this person has piloted"
 }
 },
 "type": "object",
 "description": "A person within the Star Wars universe",
 "$schema": "http://json-schema.org/draft-04/schema"
 }
 
 */
