//
//  MovieListViewController.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var moviesTableView = UITableView()
    private var viewModel: MovieListViewModel!
    var movieList: [MovieItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        self.title = "Top 250 Movie"
        viewModel = MovieListViewModel(delegate: self)
        viewModel.getMovieList()
    }
    
    private func setTableView() {
        moviesTableView.frame = self.view.frame
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        self.view.addSubview(moviesTableView)
        moviesTableView.register(UINib(nibName: MovieListCell.className, bundle: nil), forCellReuseIdentifier: "MovieListCell")
    }
    
    
}

extension MovieListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell") as! MovieListCell
        cell.setCell(movie: self.movieList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var movieDetail = MovieDetailViewController(nibName: "MovieDetailViewController", bundle: nil)
        movieDetail.id = self.movieList[indexPath.row].id
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
    
}

extension MovieListViewController : MovieListViewModelDelegate {
    
    func didMoviesReached(movieList: [MovieItem]) {
        self.movieList = movieList
        self.moviesTableView.reloadData()
    }
}

