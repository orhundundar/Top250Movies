//
//  MovieDetailViewModel.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 14.06.2023.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    var dataSource: MovieItemForLocal? { get }
 }

class MovieDetailViewModel : MovieDetailViewModelProtocol {
    
    var view: MovieDetailViewControllerProtocol
    var dataSource: MovieItemForLocal?
    
    init(viewInterface:MovieDetailViewControllerProtocol) {
        self.view = viewInterface
    }
    
    func getMovie(id:String){
        LocalDBManager.sharedInstance.getMovieItem(id: id) { movie in
            guard let movieItem = movie else {
                return //TODO
            }
            self.dataSource = movieItem
            self.view.reloadData()
        }
    }
    
}
