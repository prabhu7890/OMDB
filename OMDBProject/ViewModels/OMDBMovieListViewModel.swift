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
    var error:Observable<Error>?
    let apiService:OMDBApiService
    
    
    init(apiService:OMDBApiService) {
        self.apiService = apiService
    }
    
    init() {
        self.apiService = OMDBApiService(apiRequestor: DefaultApiRequestor())
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
    
}
