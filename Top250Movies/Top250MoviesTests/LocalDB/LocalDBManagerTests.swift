//
//  Top250MoviesTests.swift
//  Top250MoviesTests
//
//  Created by Orhun Dündar on 13.06.2023.
//

import XCTest
@testable import Top250Movies

final class LocalDBManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func saveMovieItemTest() throws {
        
        let movie = MovieItem(id: "test", rank: "test", title: "test", fullTitle: "test", year: "test", image: "test", crew: "test", imDbRating: "test", imDbRatingCount: "test")
        
        LocalDBManager.sharedInstance.saveMovieItem(movie: movie) { id in
            XCTAssertNotNil(id)
        }
        
    }
    
    
    func getMovieItemsTest() throws {
        
        LocalDBManager.sharedInstance.getMovieItems { movieItems in
            XCTAssertNotNil(movieItems)
        }
        
    }

}
