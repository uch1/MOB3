//
//  Networking.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/18/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import Foundation

class Networking {
    
    static var shared = Networking()
    
    let session = URLSession.shared
    let baseURL = "https://s3-us-west-2.amazonaws.com/mob3/image_collection.json"
    
    func fetchImages(completion: @escaping(Data) -> Void) {
        
        guard let url = URL(string: baseURL) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let imagesData = data {
                completion(imagesData)
                dump(imagesData)
            } else {
                print(error?.localizedDescription ?? "Error")
            }
            
        }.resume()
        
    }
    
}




