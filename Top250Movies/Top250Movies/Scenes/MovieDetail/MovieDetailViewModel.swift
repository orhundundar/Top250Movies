//
//  MovieDetailViewModel.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 14.06.2023.
//

import Foundation

protocol MovieDetailViewModelDelegate {
    func didMovieReached(movie:MovieItem)
}

class MovieDetailViewModel {
    
    var delegate:MovieDetailViewModelDelegate!
    
    init(delegate:MovieDetailViewModelDelegate) {
        self.delegate = delegate
    }
    
    func getMovie(id:String){
        LocalDBManager.sharedInstance.getMovieItem(id: id) { movie in
            guard let movieItem = movie else {
                return //TODO
            }
            self.delegate.didMovieReached(movie: movieItem)
        }
    }
    
}
