//
//  ViewController.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 15-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let client = StarWarsAPIClient()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getStarWarsData()
        //retrieveStarWarsPeoplePage()
        
    }

    func displayCharacter(using characterViewModel: CharacterViewModel) {
        print("\(characterViewModel.name)")
        print("\(characterViewModel.birthyear)")
        print("\(characterViewModel.birthPlace)")
        print("\(characterViewModel.height)")
        print("\(characterViewModel.eyeColour)")
        print("\(characterViewModel.hairColour)")
        print("\(characterViewModel.url)")
        print("\(characterViewModel.vehiclesPiloted)")
        //print("\(characterViewModel.starshipsPiloted)")
    }
    
    func displayVehicle(using craftViewModel: CraftViewModel) {
        print("\(craftViewModel.name)")
        print("\(craftViewModel.make)")
        print("\(craftViewModel.cost)")
        print("\(craftViewModel.length)")
        print("\(craftViewModel.craftClass)")
        print("\(craftViewModel.crewCapacity)")
        print("\(craftViewModel.url)")
    }
    
    func getStarWarsData() {
        client.getStarWarsData(from: Endpoint.character.fullURL(), to: Character.self) { [unowned self] character, error in
            if let character = character {
                let viewModel = CharacterViewModel(from: character)
                self.displayCharacter(using: viewModel)
            } else {
                print("didn't work:\(error)")
            }
        }
        client.getStarWarsData(from: Endpoint.vehicle.fullURL(), to: Vehicle.self) { [unowned self] vehicle, error in
            if let vehicle = vehicle {
                let viewModel = CraftViewModel(from: vehicle)
                self.displayVehicle(using: viewModel)
            } else {
                print("didn't work:\(error)")
            }
        }
        client.getStarWarsData(from: Endpoint.peopleLastPage.fullURL(), to: People.self) { [unowned self] people, error in
            if let people = people {
                print("People are:\(people) so why should it be")
                print("People.next is: \(people.next)")
                print("People[5] is: \(people.results[5])")
            } else {
                print("didn't work for people:\(error)")
            }
        }
    }
    
    func retrieveStarWarsPeoplePage() {
        var allCharacters: [CharacterHeader] = []
        var nextPage: String? = ""
        
        while nextPage != nil {
            client.getStarWarsData(from: Endpoint.people.fullURL(), to: People.self) { [unowned self] people, error in
                if let people = people {
                    allCharacters.append(contentsOf: people.results)
                    //print("Next page for people is :\(people.next)")
                    nextPage = people.next
                } else {
                    nextPage = nil
                }
            }
        }
        
        
    }

}

