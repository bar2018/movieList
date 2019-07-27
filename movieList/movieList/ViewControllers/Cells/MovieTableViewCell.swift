//
//  MovieTableViewCell.swift
//  movieList
//
//  Created by Bar Gantovnik on 24/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}


extension MovieTableViewCell {
    func setInfo(moviesData: Movie) {
        movieNameLabel.text = moviesData.name
        movieYearLabel.text = moviesData.year
    }
}
