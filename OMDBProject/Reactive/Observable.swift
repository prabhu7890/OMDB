//
//  Observable.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 08/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import Foundation

//This helps glue any Model (Object) to be listened for any changes thereby making changes
//A primitive version of Rx Observable
class Observable<T> {
    typealias Observer = (T) -> Void
    var observer:Observer?
    
    var value:T {
        didSet {
            observer?(value)
        }
    }
    init(_ value:T) {
        self.value = value
    }
    
    func bind(observer:Observer?) {
        self.observer = observer
        observer?(value)
    }
}
