//
//  OMDBMovieListViewModel.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 08/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import Foundation

class OMDBMovieListViewModel {
    
    var movieList:Observable<OMDBMovieList> = Observable<OMDBMovieList>(OMDBMovieList.emptyList())
    var selectedItem:Observable<OMDBMovie> = Observable<OMDBMovie>(OMDBMovie.empty())
    var error:Observable<Error>?
    let apiService:OMDBApiService
    
    
    init(apiService:OMDBApiService) {
        self.apiService = apiService
    }
    
    init() {
        self.apiService = OMDBApiService(apiRequestor: DefaultApiRequestor())
    }
    
    func cellViewModel(row:Int) -> OMDBMovieListCellViewModel? {
        if let movies = self.movieList.value.movies {
            return OMDBMovieListCellViewModel(movie: movies[row])
        }
        return nil
    }
    
    func loadData(page:Int) {
        self.apiService.getMovieList(page: page) { [weak self] (movieList, error) in
            if(error == nil) {
                if let movieList = movieList {
                    self?.movieList.value = movieList
                }
            }
            else {
                self?.error?.value = error!
            }
        }
    }
    
    func numberOfMovies() -> Int {
        if let movies = self.movieList.value.movies {
            return movies.count
        }
        return 0
    }
    
    func movieAt(row:Int) -> OMDBMovie? {
        if let movies = self.movieList.value.movies {
            return movies[row]
        }
        return nil
    }
    
    func didSelect(row:Int) {
        if let movie = movieAt(row: row) {
            self.selectedItem.value = movie
        }
    }
    
}
