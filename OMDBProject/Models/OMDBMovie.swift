//
//  OMDBMovie.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 08/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import Foundation

struct OMDBMovie {
    var name:String?
    
    init(name:String) {
        self.name = name
    }
    
    static func mapFromDictionary(dictionary:Dictionary<String, AnyObject>) -> OMDBMovie {
        let omdbMovie = OMDBMovie(name: dictionary["original_title"]! as! String)
        return omdbMovie
    }
}
