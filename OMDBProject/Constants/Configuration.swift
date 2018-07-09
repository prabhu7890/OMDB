//
//  Configuration.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 09/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import Foundation

class Configuration {
    
    static let shared:Configuration = Configuration()
    let apiKey:String
    let apiDomain:String
    
    private init() {        
        #if PREPROD
            apiKey = "8c2beea4a46c5e5306af8cd27c65c2d0"
            apiDomain = "https://preprod-api.themoviedb.org"
        #else
            apiKey = "8c2beea4a46c5e5306af8cd27c65c2d0"
            apiDomain = "https://api.themoviedb.org"
        #endif
        
    }
    
    
}
