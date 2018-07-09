//
//  OMDBMovieDetailViewModel.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 09/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import Foundation

class OMDBMovieDetailViewModel {
    var movie:Observable<OMDBMovie> = Observable<OMDBMovie>(OMDBMovie.empty())
    
    init(movie:OMDBMovie) {
        self.movie.value = movie
    }
}
