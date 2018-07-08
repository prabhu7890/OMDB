//
//  BaseApiService.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 08/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import Foundation
import Alamofire

//DI, an implementation of ApiRequestor will be passed as an instance to init method of OMDBApiService, this approach could be used for creating stub for unit testing
protocol ApiRequestor {
    func loadRequest(request:URLRequestConvertible, _ completionHandler:  (AnyObject, Error) -> Void)
}
