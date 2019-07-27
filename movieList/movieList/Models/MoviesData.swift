//
//  MoviesData.swift
//  movieList
//
//  Created by Bar Gantovnik on 24/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import Foundation

struct MoviesData: Codable {
    let movies: [Movie]
}

struct Movie: Codable {
    let id: String
    let name: String
    let year: String
    let category: String
    
    var yearAslnt: Int {
        return Int(year) ?? 0
    }
}
