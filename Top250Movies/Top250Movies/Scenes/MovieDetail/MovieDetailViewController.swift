//
//  MovieDetailViewController.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 14.06.2023.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var fullTitleTitleLabel: UILabel!
    @IBOutlet weak var fullTitleLabel: UILabel!
    
    @IBOutlet weak var rankTitleLabel: UILabel!
    @IBOutlet weak var rankNameLabel: UILabel!
    
    @IBOutlet weak var yearTitleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var crewTitleLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    
    @IBOutlet weak var imDbRatingTitleLabel: UILabel!
    @IBOutlet weak var imDbRatingLabel: UILabel!
    
    @IBOutlet weak var imDbRatingCountTitleLabel: UILabel!
    @IBOutlet weak var imDbRatingCountLabel: UILabel!
    
    
    
    private var viewModel: MovieDetailViewModel!
    var id: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MovieDetailViewModel(delegate: self)
        viewModel.getMovie(id: self.id)
    }
    
}

extension MovieDetailViewController : MovieDetailViewModelDelegate {
    
    func didMovieReached(movie: MovieItem) {
        self.title = movie.title
        posterImageView.kf.setImage(with: URL(string: movie.image))
        
    }
}
