//
//  ImageService.swift
//  movieList
//
//  Created by Bar Gantovnik on 26/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import Foundation
import UIKit


struct ImageService {
    
    enum ImageError: Error {
        case invalidURL
    }
    
   func getImage(from stringURL: String, completion: @escaping (UIImage?, Error?) -> Void) {
    
        guard let url = URL(string: stringURL) else {
            completion(nil,ImageError.invalidURL)
            return
        }
    
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image,nil)
                }
            } else {
                completion(nil, error) 
            }
            }).resume()
    }
}




