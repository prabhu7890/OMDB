//
//  ApiServiceTests.swift
//  OMDBProjectTests
//
//  Created by Prabhu Beeman on 09/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import XCTest
@testable import OMDBProject

class ApiServiceTests: XCTestCase {
    
    //system under test
    var sut: OMDBApiService?
    
    override func setUp() {
        super.setUp()
        sut = OMDBApiService(apiRequestor: DefaultApiRequestor())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_nowplaying_movies() {
        
        // Given
        let sut = self.sut!
        
        // When fetch now playing movies
        let expect = XCTestExpectation(description: "callback")
        
        //Then
        sut.getMovieList(page: 1) { movieList, error in
            expect.fulfill()
            XCTAssert(movieList != nil && movieList!.movies!.count > 0)
            for movie in movieList!.movies! {
                XCTAssert(!movie.isEmpty)
            }
        }
        wait(for: [expect], timeout: 5)
    }
    
}
