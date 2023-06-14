//
//  Top250MoviesResponseModel.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 14.06.2023.
//

import Foundation
import RealmSwift
import ObjectMapper

// MARK: - MovieItem
open class MovieItem: Object, Codable {
    @objc dynamic var id: String
    @objc dynamic var rank: String
    @objc dynamic var title: String
    @objc dynamic var fullTitle: String
    @objc dynamic var year: String
    @objc dynamic var image: String
    @objc dynamic var crew: String
    @objc dynamic var imDbRating: String
    @objc dynamic var imDbRatingCount: String
}

// MARK: - Top250MoviesResponseModel
open class Top250MoviesResponseModel: Codable {
    let items: [MovieItem]
    let errorMessage: String
}
