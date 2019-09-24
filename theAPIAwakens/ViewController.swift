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
    var allCharacters: [Character] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getStarWarsData()
        //retrieveStarWarsPeoplePage()
        print("\n\n\n\n")
        retrieveStarWarsPage(using: Endpoint.people.fullURL())
        
        
    }

    func displayCharacter(using characterViewModel: CharacterViewModel) {
        print("\(characterViewModel.name)")
        print("\(characterViewModel.birthyear)")
        print("\(characterViewModel.home)")
        print("\(characterViewModel.height)")
        print("\(characterViewModel.eyeColour)")
        print("\(characterViewModel.hairColour)")
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
                if let viewModel = CharacterViewModel(from: character) {
                    self.displayCharacter(using: viewModel)
                }
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
    
    func retrieveStarWarsPage(using thisURL: URL?) {
        
        if thisURL == nil {
            return
        } else {    //Make network call using API client with the URL
            client.getStarWarsData(from: thisURL, to: People.self) { [unowned self] people, error in
                if let people = people {
                    //Append people's characters to the allCharacters array
                    self.allCharacters.append(contentsOf: people.results)
                    //print("AllCharacters are: \(self.allCharacters) \n and count is: \(self.allCharacters.count)")
                    
                    //Check if there is a next page, and that it can be created into an URL.  If so, call this method again.
                    if let nextURL = people.next {
                        self.retrieveStarWarsPage(using: nextURL)
                    } else {
                        print("AllCharacters count is: \(self.allCharacters.count)")
                    }
                } else {
                    print("Error in retrieveStarWarsPage is: \(error)")     ///Create an alert here??
                }
            }
        }
    }
}

