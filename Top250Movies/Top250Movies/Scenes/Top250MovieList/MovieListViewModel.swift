//
//  MovieListViewModel.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import Foundation

protocol MovieListViewModelProtocol {
    var dataSource: [MovieItem]? { get }
 }

class MovieListViewModel: MovieListViewModelProtocol {
    
    var view: MovieListViewControllerProtocol
    private(set) var dataSource : [MovieItem]?
    
    init(viewInterface: MovieListViewControllerProtocol){
        view = viewInterface
    }
    
    func getMovieList(){
        LocalDBManager.sharedInstance.getMovieItems { movieList in
            self.dataSource = movieList
            self.view.reloadData()
        }
    }
    
}
