//
//  OMDBProjectTests.swift
//  OMDBProjectTests
//
//  Created by Prabhu Beeman on 08/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import XCTest
import Alamofire

@testable import OMDBProject

class OMDBMovieListTests: XCTestCase {
    
    var sut: OMDBMovieListViewModel!
    var mockApiService: OMDBApiService!
    
    override func setUp() {
        super.setUp()
        self.mockApiService = OMDBApiService(apiRequestor: MockApiRequestor())
        self.sut = OMDBMovieListViewModel(apiService: self.mockApiService)
    }
    
    override func tearDown() {        
        self.sut = nil
        self.mockApiService = nil
        super.tearDown()
    }
    
    func test_movies_fetch() {
        
        //Given
        let expect = XCTestExpectation(description: "movies fetched")
        sut.movieList.bind { _ in
            expect.fulfill()
        }
        //When
        sut.loadData(page: 1)
        
        //Then
        XCTAssert(sut.numberOfMovies() == 2)
    }
    
    func test_movie_user_tap() {
        
        //Given
        let expect = XCTestExpectation(description: "Selected movie is loaded")
        sut.selectedItem.bind { _ in
            expect.fulfill()
        }
        sut.loadData(page: 1)
        
        //When
        sut.didSelect(row: 1)
        
        //Then
        XCTAssert(sut.selectedMovie.name! == "Mad Max")
    }
    
    
}


class MockApiRequestor: ApiRequestor {
    
    init(){}
    
    private func dummyData() -> Dictionary<String, AnyObject> {
        var dummyData = Dictionary<String, AnyObject>()
        var movieList = [Dictionary<String, String>]()
        movieList.append(["original_title" : "Black Panther"])
        movieList.append(["original_title" : "Mad Max"])
        dummyData["results"] = movieList as AnyObject
        return dummyData
    }
    
    func loadRequest(urlRequest:URLRequestConvertible, _ completionHandler:  @escaping (AnyObject?, Error?) -> Void) {
        completionHandler(dummyData() as AnyObject, nil)
    }
}
