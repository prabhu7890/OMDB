//
//  OMDBMovieListCellViewModel.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 09/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import Foundation

class OMDBMovieListCellViewModel {
    var movieName:String?
    
    init(movie:OMDBMovie) {
        self.movieName = movie.name
    }
}
