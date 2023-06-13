//
//  MovieListViewModel.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import Foundation

protocol MovieListViewModelDelegate {
    func didMoviesReached(movieList:[MovieItem])
}

class MovieListViewModel {
    
    var delegate:MovieListViewModelDelegate!
    
    init(delegate:MovieListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func getMovieList(){
        LocalDBManager.sharedInstance.getMovieItems { movieList in
            self.delegate.didMoviesReached(movieList: movieList)
        }
    }
    
}
