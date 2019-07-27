//
//  AlertService.swift
//  movieList
//
//  Created by Bar Gantovnik on 27/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import UIKit

struct AlertService {
    
    static func getErrorAlert(with text: String? = nil) -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okButton)
        return alert
    }
}

