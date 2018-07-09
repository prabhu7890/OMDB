//
//  DefaultApiRequestor.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 09/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import Foundation
import Alamofire

class DefaultApiRequestor: ApiRequestor {
    
    var manager: Alamofire.SessionManager!
    
    init() {
        self.manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: [:])
        )
    }
    
    func loadRequest(urlRequest:URLRequestConvertible, _ completionHandler:  @escaping (AnyObject?, Error?) -> Void) {        
        self.manager.request(urlRequest as URLRequestConvertible).responseJSON { dataResponse in
            //let response = dataResponse.response
            let error = dataResponse.error
            let data = dataResponse.data
            do {
                let dictionary:Dictionary<String, AnyObject> = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String, AnyObject>
                completionHandler(dictionary as AnyObject, error)
            }
            catch {
                completionHandler(nil, error)
            }
            
        }
    }
}
