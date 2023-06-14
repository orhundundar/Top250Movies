//
//  RootViewController.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 14.06.2023.
//

import UIKit

class RootViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        showLoading()
        getDatas()
    }
    
    private func getDatas(){
        IMDBApiManager.getTop250Movies { movies in
            
            let group = DispatchGroup()
            
            for movie in movies! {
                group.enter()
                LocalDBManager.sharedInstance.saveMovieItem(movie: movie) { id in
                    print(id)
                    group.leave()
                }
            }
            
            group.notify(queue: .main) { [weak self] in
                self?.dismissLoading()
                let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
                let navController = UINavigationController(rootViewController: MovieListViewController())
                sceneDelegate.setRootViewController(navController)
            }
            
        }
    }
    
}
