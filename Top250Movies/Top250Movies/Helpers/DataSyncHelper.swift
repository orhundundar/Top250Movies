//
//  DataSyncHelper.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 14.06.2023.
//

import UIKit
import NetworkAPI

class DataSyncHelper {
    
    private var loadingVC: BaseViewController!
    
    func syncDatas(){
        
        getDatas()
        
    }
    
    private func getDatas(){
        
        NetworkAPI.TopMovieService().getMoviesList { response in
            
            let movies = response.items
            let group = DispatchGroup()
            
            for movie in movies {
                group.enter()
                let movieforLocal = MovieItemForLocal(id: movie.id, rank: movie.rank, title: movie.title, fullTitle: movie.fullTitle, year: movie.year, image: movie.image, crew: movie.crew, imDbRating: movie.imDbRating, imDbRatingCount: movie.imDbRatingCount)
                LocalDBManager.sharedInstance.saveMovieItem(movie: movieforLocal) { id in
                    print(id)
                    group.leave()
                }
            }
            
            group.notify(queue: .main) { [weak self] in
                self?.loadingVC.dismissLoading()
                let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
                let navController = UINavigationController(rootViewController: MovieListViewController())
                sceneDelegate.setRootViewController(navController)
            }
            
        } failure: { message in
            print(message)
            //TODO
        }
        
    }
    
}
