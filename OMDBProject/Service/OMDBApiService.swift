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
    
    func getMovieList(page: Int, completionHandler: @escaping (OMDBMovieList?, Error?) -> Void) {        
        self.apiRequestor.loadRequest(urlRequest: RequestRouter.getMovieList(page)) { (responseDict, error) -> Void in
            if error == nil {
                if let dict = responseDict as? Dictionary<String, AnyObject> {
                    let movieList = OMDBMovieList.mapFromDictionary(dictionary: dict)
                    completionHandler(movieList, error)
                }
            }
            else {
                completionHandler(nil, error)
                print(error?.localizedDescription)
            }
        }
    }
        
} 
