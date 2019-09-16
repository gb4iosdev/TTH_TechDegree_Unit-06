//
//  Character.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 16-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import Foundation

struct Character {
    /*
     
     {
     "name": "Luke Skywalker",
     "height": "172",
     "mass": "77",
     "hair_color": "blond",
     "skin_color": "fair",
     "eye_color": "blue",
     "birth_year": "19BBY",
     "gender": "male",
     "homeworld": "https://swapi.co/api/planets/1/",
     "films": [
     "https://swapi.co/api/films/2/",
     "https://swapi.co/api/films/6/",
     "https://swapi.co/api/films/3/",
     "https://swapi.co/api/films/1/",
     "https://swapi.co/api/films/7/"
     ],
     "species": [
     "https://swapi.co/api/species/1/"
     ],
     "vehicles": [
     "https://swapi.co/api/vehicles/14/",
     "https://swapi.co/api/vehicles/30/"
     ],
     "starships": [
     "https://swapi.co/api/starships/12/",
     "https://swapi.co/api/starships/22/"
     ],
     "created": "2014-12-09T13:50:51.644000Z",
     "edited": "2014-12-20T21:17:56.891000Z",
     "url": "https://swapi.co/api/people/1/"
     }
     
    */
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
