//
//  ViewController.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 15-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let apiKey = "???????"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let starWarsBaseURL = URL(string: "https://swapi.co/api/")
        let starWarsAPICharacterURL = URL(string: "people", relativeTo: starWarsBaseURL)
    }


}

