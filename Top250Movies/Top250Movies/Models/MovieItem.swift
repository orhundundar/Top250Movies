//
//  MovieItem.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import Foundation

// MARK: - MovieItem
class MovieItem: Codable {
    let id: String
    let rank: String
    let title: String
    let fullTitle: String
    let year: String
    let image: String
    let crew: String
    let imDbRating: String
    let imDbRatingCount: String
}
