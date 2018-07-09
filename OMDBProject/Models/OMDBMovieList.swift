//
//  OMDBMovieList.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 08/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import Foundation

struct OMDBMovieList {
    
    var movies:[OMDBMovie]?
    
    init(movies:[OMDBMovie]) {
        self.movies = movies
    }
    
    static func emptyList() -> OMDBMovieList {
        return OMDBMovieList(movies: [])
    }
    
    static func mapFromDictionary(dictionary:Dictionary<String, AnyObject>) -> OMDBMovieList? {
        let movieDictList = dictionary["results"] as! [Dictionary<String, AnyObject>]
        var movieList:[OMDBMovie] = []
        for movieDict in movieDictList {
            movieList.append(OMDBMovie.mapFromDictionary(dictionary: movieDict))
        }
        return OMDBMovieList(movies: movieList)
    }
}
