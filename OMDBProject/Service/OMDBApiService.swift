//
//  OMDBApiService.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 08/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import Foundation
import Alamofire

class OMDBApiService {
    
    private let apiRequestor:ApiRequestor
    
    init(apiRequestor:ApiRequestor) {
        self.apiRequestor = apiRequestor
    }
    
    func getMovieList(completionHandler: (OMDBMovieList, Error) -> Void) {
        
        self.apiRequestor.loadRequest(request: RequestRouter.getMovieList()) { (response, error) -> Void in
            //TODO: get response data and create a OMDBMovieList and pass on the error
            
        }
    }
        
} 
