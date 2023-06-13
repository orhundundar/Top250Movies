//
//  ViewController.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        IMDBApiManager.getTop250Movies { movies in
            
            for movie in movies! {
                LocalDBManager.sharedInstance.saveMovieItem(movie: movie) { id in
                    print(id)
                }
            }
        }
        
        LocalDBManager.sharedInstance.getMovieItems { movieList in
            print(movieList)
        }
        
        
        
    }


}

