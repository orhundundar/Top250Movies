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
    @objc public dynamic var id: String
    @objc public dynamic var rank: String
    @objc public dynamic var title: String
    @objc public dynamic var fullTitle: String
    @objc public dynamic var year: String
    @objc public dynamic var image: String
    @objc public dynamic var crew: String
    @objc public dynamic var imDbRating: String
    @objc public dynamic var imDbRatingCount: String
}

// MARK: - Top250MoviesResponseModel
open class Top250MoviesResponseModel: Codable {
    public let items: [MovieItem]
    public let errorMessage: String
}
