//
//  MovieDetails.swift
//  movieList
//
//  Created by Bar Gantovnik on 24/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import Foundation

struct MovieDetails: Codable {
    
    let id: String
    let name: String
    let year: String
    let category: String
    let description: String
    var imageUrl: String
}

