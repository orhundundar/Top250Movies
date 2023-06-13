//
//  Top250MoviesResponseModel.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import Foundation

// MARK: - Top250MoviesResponseModel
class Top250MoviesResponseModel: Codable {
    let items: [MovieItem]
    let errorMessage: String
}


