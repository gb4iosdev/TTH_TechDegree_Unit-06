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
        retrieveStarWarsPages(using: Endpoint.people.fullURL())
        
        
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
        client.getStarWarsData(from: Endpoint.character.fullURL(), toType: Character.self) { [unowned self] character, error in
            if let character = character {
                if let viewModel = CharacterViewModel(from: character) {
                    self.displayCharacter(using: viewModel)
                }
            } else {
                print("didn't work:\(error)")
            }
        }
        client.getStarWarsData(from: Endpoint.vehicle.fullURL(), toType: Vehicle.self) { [unowned self] vehicle, error in
            if let vehicle = vehicle {
                let viewModel = CraftViewModel(from: vehicle)
                self.displayVehicle(using: viewModel)
            } else {
                print("didn't work:\(error)")
            }
        }
        client.getStarWarsData(from: Endpoint.peopleLastPage.fullURL(), toType: People.self) { [unowned self] people, error in
            if let people = people {
                print("People are:\(people) so why should it be")
                print("People.next is: \(people.next)")
                print("People[5] is: \(people.results[5])")
            } else {
                print("didn't work for people:\(error)")
            }
        }
    }
    
    func retrieveStarWarsPages(using thisURL: URL?) {
        
        if thisURL == nil {
            return
        } else {    //Make network call using API client with the URL
            client.getStarWarsData(from: thisURL, toType: People.self) { [unowned self] people, error in
                if let people = people {
                    //Append people's characters to the allCharacters array
                    self.allCharacters.append(contentsOf: people.results)
                   
                    //Check if there is a next page, and that it can be created into an URL.  If so, call this method again.
                    if let nextURL = people.next {
                        self.retrieveStarWarsPages(using: nextURL)
                    } else {
                        print("AllCharacters count is: \(self.allCharacters.count)")
                        People.allCharacters = self.allCharacters
                        print(People.allCharacters)
                    }
                } else {
                    print("Error in retrieveStarWarsPage is: \(error)")     ///Create an alert here??
                }
            }
        }
    }
    
    //Write a function that takes an array of URL's and makes network calls to populate an array of results (names) and knows when it has finished.
    func retrieveMultipleDiscreteURLS(using thisURL: [URL]) {
        
        
    }
    
    //This updates the detail on a single entity & then the viewModel and would go on the 2nd VC:
    @IBAction func pickedCharacter(_ sender: UIButton) {
        
        guard let chars = People.allCharacters else { return }
        
        print(People.allCharacters?[4])
    
        var character = chars[4]
        
        if let characterViewModel = character.viewModel {
            //Update the static tableview from the viewModel
            //updateTableView(from: characterViewModel)
        } else {                   //execute network call to fetch the detail for the character.
            client.getStarWarsData(from: character.url, toType: CharacterDetail.self) { [unowned self] characterDetail, error in
                if let characterDetail = characterDetail {
                    character.detail = characterDetail
                    //Get associated derived data.  Check vehicles and starship static data first
                    
                    //Generate the view model & assign to character
                    character.viewModel = CharacterViewModel(from: character)
                    //updateTableView(from: characterViewModel)
                    print(character.viewModel)
                    People.allCharacters?[4] = character
                    print(People.allCharacters?[4])
                } else {
                    print("didn't work:\(error)")
                }
            }
        }
    }
    
    
}




