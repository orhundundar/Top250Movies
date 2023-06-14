//
//  MovieListViewController.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import UIKit

protocol MovieListViewControllerProtocol {
    func reloadData()
    func showErrorMessage(message: String)
}

class MovieListViewController: BaseViewController {
    
    var moviesTableView = UITableView()
    private var viewModel: MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        self.title = "MovieListViewController.title".localized
        viewModel = MovieListViewModel(viewInterface: self)
        viewModel.getMovieList()
    }
    
    private func setTableView() {
        moviesTableView.frame = self.view.frame
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        self.view.addSubview(moviesTableView)
        moviesTableView.register(UINib(nibName: MovieListCell.className, bundle: nil), forCellReuseIdentifier: MovieListCell.className)
    }
    
}

extension MovieListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.className) as! MovieListCell
        cell.setCell(movie: self.viewModel.dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetail = MovieDetailViewController(nibName: "MovieDetailViewController", bundle: nil)
        movieDetail.id = viewModel.dataSource[indexPath.row].id
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
    
}

extension MovieListViewController: MovieListViewControllerProtocol {
    
    func reloadData() {
        self.moviesTableView.reloadData()
    }
    
    func showErrorMessage (message: String) {
        self.showAlert(title: "error".localized, message: message)
    }
}
