//
//  TopMovieService.swift
//  NetworkAPI
//
//  Created by Orhun Dündar on 14.06.2023.
//

import Foundation
protocol TopMovieServiceProtocol {
    func getMoviesList(success: @escaping(Top250MoviesResponseModel) -> Void, failure: @escaping(String) -> Void)
}

open class TopMovieService: TopMovieServiceProtocol {
    public init() {}
    
    open func getMoviesList(success: @escaping(Top250MoviesResponseModel) -> Void, failure: @escaping(String) -> Void) {
        NetworkManager.shared.sendRequestWith(target: .top250Movies) { response in
            print(response)
            success(response as! Top250MoviesResponseModel)
        } failure: { str in
            print(str)
            failure(str)
        }

    }
}
