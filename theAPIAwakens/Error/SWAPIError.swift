//
//  SWAPIError.swift
//  theAPIAwakens
//
//  Created by Gavin Butler on 18-09-2019.
//  Copyright © 2019 Gavin Butler. All rights reserved.
//

import Foundation

enum SWAPIError: Error {
    
    case requestFailed
    case responseUnsuccessful(statusCode: Int)
    case invalidData
    case jsonParsingFailure
}
