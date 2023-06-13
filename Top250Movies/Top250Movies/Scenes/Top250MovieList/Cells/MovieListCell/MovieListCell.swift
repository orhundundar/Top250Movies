//
//  MovieListCell.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import UIKit

class MovieListCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rankTitleLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var ratingTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.numberOfLines = 0
        
        rankTitleLabel.text = "Rank:"
        rankTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        rankTitleLabel.textColor = .gray
        
        rankLabel.font = UIFont.systemFont(ofSize: 14)
        rankLabel.textColor = .gray
        
        ratingTitleLabel.text = "Rating:"
        ratingTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        ratingTitleLabel.textColor = .gray
        
        ratingLabel.font = UIFont.systemFont(ofSize: 14)
        ratingLabel.textColor = .gray
        
        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .none
        
    }
    
    func setCell(movie:MovieItem) {
        titleLabel.text = movie.title
        rankLabel.text = movie.rank
        ratingLabel.text = movie.imDbRating
        layoutSubviews()
    }
    
    
}
