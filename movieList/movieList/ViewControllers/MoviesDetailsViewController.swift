//
//  MoviesDetails.swift
//  movieList
//
//  Created by Bar Gantovnik on 24/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import UIKit

class MoviesDetailsViewController: UIViewController {
    
    var id: String?
    var movieName: String?
    var movieDetails: MovieDetails?
    let apiService = APIService()
    let imageService = ImageService()
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieNameLabel.text = movieName
        
        guard let id = id else {
            self.present(AlertService.getErrorAlert(with: "No movie id found"), animated: true, completion: nil)
            return
        }
        
        apiService.getMoviesDetailsData(for: id) { (movieDetails, error) in
            if let movieDetails = movieDetails {
                self.movieDetails = movieDetails
                self.movieDescriptionLabel.text = movieDetails.description
                self.setupImage()
            } else {
                self.present(AlertService.getErrorAlert(with: "Could not load movie details"), animated: true, completion: nil)
            }
        }
    }
    
    func setupImage() {
        guard let movieImageUrl = movieDetails?.imageUrl else {
            self.present(AlertService.getErrorAlert(with: "No url found"), animated: true, completion: nil)
            return
        }
        
        imageService.getImage(from: movieImageUrl) { (image, error) in
            if let image = image {
                self.moviePoster.image = image
            } else {
                self.present(AlertService.getErrorAlert(with: "Could not load image"), animated: true, completion: nil)
            }
        }
    }
    
    func setupFromSegue(id: String, movieName: String) {
        self.id = id
        self.movieName = movieName
    }
}
