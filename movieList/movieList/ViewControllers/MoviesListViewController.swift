//
//  ViewController.swift
//  movieList
//
//  Created by Bar Gantovnik on 24/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    var movies: [Movie]?
    var filteredMovies: [Movie]?
    let apiService = APIService()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService.getMoviesData { (moviesData, error) in
            if let moviesData = moviesData {
                self.movies = moviesData.movies.sorted { $0.yearAslnt < $1.yearAslnt }
                self.filteredMovies = self.movies
                self.movieTableView.reloadData()
            } else {
                self.present(AlertService.getErrorAlert(), animated: true, completion: nil)
            }
        }
        
        movieTableView.dataSource = self
        searchBar.delegate = self
        movieTableView.reloadData()
    }
    
    enum SegueIdentifier {
        static let movieDetailsSegue = "MovieDetailsSegue"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        searchBar.resignFirstResponder()
        if segue.identifier == SegueIdentifier.movieDetailsSegue {
            if let indexPath = movieTableView.indexPathForSelectedRow {
                let movieDetailsVC = segue.destination as? MoviesDetailsViewController
                if let filteredMovies = filteredMovies {
                movieDetailsVC?.setupFromSegue(id: filteredMovies[indexPath.row].id, movieName: filteredMovies[indexPath.row].name)
                }
            }
        }
    }
}

extension MoviesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        if let movie = filteredMovies?[indexPath.row] {
            cell.setInfo(moviesData: movie)
        }
        return cell
    }
}

extension MoviesListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            filteredMovies = movies
            movieTableView.reloadData()
            return
        }
        
        filteredMovies = movies?.filter({ (movie) -> Bool in
            return movie.name.contains(searchText)
        })
        movieTableView.reloadData()
    }
}
