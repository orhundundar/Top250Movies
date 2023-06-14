//
//  MovieItem.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import Foundation
import RealmSwift
import ObjectMapper

// MARK: - MovieItem
class MovieItem: Object, Codable {
    @objc dynamic var id: String
    @objc dynamic var rank: String
    @objc dynamic var title: String
    @objc dynamic var fullTitle: String
    @objc dynamic var year: String
    @objc dynamic var image: String
    @objc dynamic var crew: String
    @objc dynamic var imDbRating: String
    @objc dynamic var imDbRatingCount: String
    
    convenience init(id: String, rank: String, title: String, fullTitle: String, year: String, image: String, crew: String, imDbRating: String, imDbRatingCount: String) {
        self.init()
        self.id = id
        self.rank = rank
        self.title = title
        self.fullTitle = fullTitle
        self.year = year
        self.image = image
        self.crew = crew
        self.imDbRating = imDbRating
        self.imDbRatingCount = imDbRatingCount
    }
    
}
