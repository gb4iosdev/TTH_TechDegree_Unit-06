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
        client.getStarWarsData(for: .character) { [unowned self] character, error in
            if let character = character {
                let viewModel = CharacterViewModel(from: character)
                self.displayCharacter(using: viewModel)
            }
            
        }
        
        
        
        
    }

    func displayCharacter(using characterViewModel: CharacterViewModel) {
        print("\(characterViewModel.name)")
        print("\(characterViewModel.birthyear)")
        //print("\(characterViewModel.birthPlace)")
        print("\(characterViewModel.height)")
        print("\(characterViewModel.eyeColour)")
        print("\(characterViewModel.hairColour)")
        //print("\(characterViewModel.vehiclesPiloted)")
        //print("\(characterViewModel.starshipsPiloted)")
    }

}

