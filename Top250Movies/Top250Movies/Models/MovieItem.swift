//
//  MovieItem.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import RealmSwift
import ObjectMapper

// MARK: - MovieItem
class MovieItem: Object, Codable {
    @objc var id: String
    @objc var rank: String
    @objc var title: String
    @objc var fullTitle: String
    @objc var year: String
    @objc var image: String
    @objc var crew: String
    @objc var imDbRating: String
    @objc var imDbRatingCount: String
}
