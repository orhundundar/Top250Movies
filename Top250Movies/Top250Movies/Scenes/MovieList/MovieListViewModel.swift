//
//  MovieListViewModel.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import Foundation

protocol MovieListViewModelProtocol {
    var dataSource: [MovieItemForLocal]! { get }
 }

class MovieListViewModel: MovieListViewModelProtocol {
    
    var view: MovieListViewControllerProtocol
    private(set) var dataSource : [MovieItemForLocal]!
    
    init(viewInterface: MovieListViewControllerProtocol){
        view = viewInterface
    }
    
    func getMovieList(){
        LocalDBManager.sharedInstance.getMovieItems { movieList in
            
            guard let movies = movieList else {
                self.view.showErrorMessage(message: "MovieListViewModel.error.emptyList".localized)
                return
            }
            
            self.dataSource = movies
            self.view.reloadData()
        }
    }
    
}
