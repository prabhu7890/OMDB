//
//  RequestRouter.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 08/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import Foundation
import Alamofire

//RequestRouter defines the api calls (path, http method, content type and so on depending on the case)
enum RequestRouter: URLRequestConvertible {
    
    //TODO: Ideally the domain will have to be in a separate configuration class which will be picked up based on the environment (using the preprocessor macros)
    static let apiPath:String = "api url goes here"
    
    case getMovieList()
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getMovieList():
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url:URL = URL(string: RequestRouter.apiPath)!
        let urlRequest:URLRequest = URLRequest(url: url)
        
        //Set Parameters here
        let encoding:ParameterEncoding = Alamofire.URLEncoding.default
        var parameters:[String:String]?
        var request:URLRequest?
        switch(self) {
        case .getMovieList():
            //TODO: These are to be generalized by passing values as parameters than being hardcoded here
            parameters = ["param": "value"]
        }
        do {
            try request = encoding.encode(urlRequest as URLRequestConvertible, with: parameters)
        }
        catch {
            fatalError("Failed creating a request")
        }
        return request!
    }
    
    
}
