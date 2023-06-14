//
//  MovieDetailViewController.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 14.06.2023.
//

import UIKit
import Kingfisher

protocol MovieDetailViewControllerProtocol {
    func reloadData()
    func showErrorMessage(message: String)
}

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var fullTitleTitleLabel: UILabel!
    @IBOutlet weak var fullTitleLabel: UILabel!
    @IBOutlet weak var rankTitleLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
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
        setUI()
        viewModel = MovieDetailViewModel(viewInterface: self)
        viewModel.getMovie(id: self.id)
    }
    
    private func setUI(){
        fullTitleTitleLabel.text = "Full Title:"
        fullTitleTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        fullTitleTitleLabel.textColor = .gray
        
        fullTitleLabel.font = UIFont.systemFont(ofSize: 14)
        fullTitleLabel.textColor = .gray
        fullTitleLabel.numberOfLines = 0
        
        rankTitleLabel.text = "Rank:"
        rankTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        rankTitleLabel.textColor = .gray
        
        rankLabel.font = UIFont.systemFont(ofSize: 14)
        rankLabel.textColor = .gray
        rankLabel.numberOfLines = 0
        
        yearTitleLabel.text = "Year:"
        yearTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        yearTitleLabel.textColor = .gray
        
        yearLabel.font = UIFont.systemFont(ofSize: 14)
        yearLabel.textColor = .gray
        yearLabel.numberOfLines = 0
        
        crewTitleLabel.text = "Crew:"
        crewTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        crewTitleLabel.textColor = .gray
        
        crewLabel.font = UIFont.systemFont(ofSize: 14)
        crewLabel.textColor = .gray
        crewLabel.numberOfLines = 0
        
        imDbRatingTitleLabel.text = "Rating:"
        imDbRatingTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        imDbRatingTitleLabel.textColor = .gray
        
        imDbRatingLabel.font = UIFont.systemFont(ofSize: 14)
        imDbRatingLabel.textColor = .gray
        imDbRatingLabel.numberOfLines = 0
        
        imDbRatingCountTitleLabel.text = "Rating Count:"
        imDbRatingCountTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        imDbRatingCountTitleLabel.textColor = .gray
        
        imDbRatingCountLabel.font = UIFont.systemFont(ofSize: 14)
        imDbRatingCountLabel.textColor = .gray
        imDbRatingCountLabel.numberOfLines = 0
    }
    
}

extension MovieDetailViewController : MovieDetailViewControllerProtocol {
    
    func reloadData() {
        self.title = self.viewModel.dataSource?.title
        coverImageView.kf.setImage(with: URL(string: self.viewModel.dataSource?.image ?? ""))
        fullTitleLabel.text = self.viewModel.dataSource?.fullTitle
        rankLabel.text = self.viewModel.dataSource?.rank
        yearLabel.text = self.viewModel.dataSource?.year
        crewLabel.text = self.viewModel.dataSource?.crew
        imDbRatingLabel.text = self.viewModel.dataSource?.imDbRating
        imDbRatingCountLabel.text = self.viewModel.dataSource?.imDbRatingCount
    }
    
    func showErrorMessage(message: String) {
        //TODO
    }
}
