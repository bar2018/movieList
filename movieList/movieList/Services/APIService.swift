//
//  APIService.swift
//  movieList
//
//  Created by Bar Gantovnik on 24/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import UIKit

struct APIService {
    
    enum ServiceError: Error {
        case invalidURL
    }
    
    func getMoviesData(completion: @escaping (MoviesData?, Error?) -> Void) {
        
        guard let url = URL(string: "http://x-mode.co.il/exam/allMovies/allMovies.txt") else {
            completion(nil, ServiceError.invalidURL)
            return
        }
        
        
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let moviesData = try decoder.decode(MoviesData.self, from: data)
                    DispatchQueue.main.async {
                        completion(moviesData, nil)
                    }
                } catch {
                    completion(nil, error)
                }
            }
            }.resume()
    }
    
    
    func getMoviesDetailsData(for id: String, completion: @escaping (MovieDetails?, Error?) -> Void) {
        
        guard let url = URL(string: "http://x-mode.co.il/exam/descriptionMovies/\(id).txt") else { // id = 1001, 1002, 1003.......1009
            completion(nil, ServiceError.invalidURL)
            return
        }
        
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let moviesDetails = try decoder.decode(MovieDetails.self, from: data)
                    DispatchQueue.main.async {
                        completion(moviesDetails, nil)
                    }
                } catch {
                    completion(nil, error)
                }
            }
            }.resume()
    }
}





