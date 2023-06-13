//
//  IMDBApiManager.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import Foundation
import Alamofire

class IMDBApiManager {
    
    static let apiKey = "k_9ayfvyqv"
    static let baseUrl = "https://imdb-api.com/"
    
    static func getTop250Movies(movies: @escaping ([MovieItem]?) -> Void){
        
        ApiManager.sendRequest(url: "https://imdb-api.com/en/API/Top250Movies/k_9ayfvyqv") { data in
            
            guard let responseData = data else {
                return
            }
            
            let top250MoviesResponseModel = try? JSONDecoder().decode(Top250MoviesResponseModel.self, from: responseData)
            
            movies(top250MoviesResponseModel?.items)
            
        }
        
    }
    
    
}
