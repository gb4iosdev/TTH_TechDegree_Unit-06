//
//  Vehicle.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 16-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import Foundation

struct Vehicle: Craft, Codable {
    
    let name: String
    let make: String
    let cost: String
    let length: String
    let craftClass: String
    let crewCapacity: String
    let craftType: CraftType = .vehicle
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case make = "model"
        case cost = "cost_in_credits"
        case length
        case craftClass = "vehicle_class"
        case crewCapacity = "crew"
        case url
    }
    
    func fetchDetail() {
        
    }
}

    /*
     
     {
     "name": "Sand Crawler",
     "model": "Digger Crawler",
     "manufacturer": "Corellia Mining Corporation",
     "cost_in_credits": "150000",
     "length": "36.8",
     "max_atmosphering_speed": "30",
     "crew": "46",
     "passengers": "30",
     "cargo_capacity": "50000",
     "consumables": "2 months",
     "vehicle_class": "wheeled",
     "pilots": [],
     "films": [
     "https://swapi.co/api/films/5/",
     "https://swapi.co/api/films/1/"
     ],
     "created": "2014-12-10T15:36:25.724000Z",
     "edited": "2014-12-22T18:21:15.523587Z",
     "url": "https://swapi.co/api/vehicles/4/"
     },
     
    */



/* Schema:
 
 {
 "title": "Starship",
 "required": [
 "name",
 "model",
 "manufacturer",
 "cost_in_credits",
 "length",
 "max_atmosphering_speed",
 "crew",
 "passengers",
 "cargo_capacity",
 "consumables",
 "vehicle_class",
 "pilots",
 "films",
 "created",
 "edited",
 "url"
 ],
 "properties": {
 "max_atmosphering_speed": {
 "type": "string",
 "description": "The maximum speed of this vehicle in atmosphere."
 },
 "crew": {
 "type": "string",
 "description": "The number of personnel needed to run or pilot this vehicle."
 },
 "pilots": {
 "type": "array",
 "description": "An array of People URL Resources that this vehicle has been piloted by."
 },
 "films": {
 "type": "array",
 "description": "An array of Film URL Resources that this vehicle has appeared in."
 },
 "created": {
 "format": "date-time",
 "type": "string",
 "description": "The ISO 8601 date format of the time that this resource was created."
 },
 "model": {
 "type": "string",
 "description": "The model or official name of this vehicle. Such as All Terrain Attack Transport."
 },
 "vehicle_class": {
 "type": "string",
 "description": "The class of this vehicle, such as Wheeled."
 },
 "edited": {
 "format": "date-time",
 "type": "string",
 "description": "the ISO 8601 date format of the time that this resource was edited."
 },
 "name": {
 "type": "string",
 "description": "The name of this vehicle. The common name, such as Sand Crawler."
 },
 "cost_in_credits": {
 "type": "string",
 "description": "The cost of this vehicle new, in galactic credits."
 },
 "manufacturer": {
 "type": "string",
 "description": "The manufacturer of this vehicle. Comma seperated if more than one."
 },
 "cargo_capacity": {
 "type": "string",
 "description": "The maximum number of kilograms that this vehicle can transport."
 },
 "length": {
 "type": "string",
 "description": "The length of this vehicle in meters."
 },
 "consumables": {
 "type": "string",
 "description": "The maximum length of time that this vehicle can provide consumables for its entire crew without having to resupply."
 },
 "url": {
 "format": "uri",
 "type": "string",
 "description": "The hypermedia URL of this resource."
 },
 "passengers": {
 "type": "string",
 "description": "The number of non-essential people this vehicle can transport."
 }
 },
 "type": "object",
 "description": "A vehicle.",
 "$schema": "http://json-schema.org/draft-04/schema"
 }
 
*/
