//
//  Networking.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/18/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import Foundation
import Zip

class Networking {
    
    static var shared = Networking()
    
    let session = URLSession.shared
    let baseURL = "https://s3-us-west-2.amazonaws.com/mob3/image_collection.json"
    
    // Fetching data from the provided URL e.g. baseURL
    func fetch(completion: @escaping(Data) -> Void) {
        
        guard let url = URL(string: baseURL) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                completion(data)
                dump(data)
            } else {
                print(error?.localizedDescription ?? "Error")
            }
            
        }.resume()
        
    }
    
    // Fetching the content from the unzipped files
    func fetchDownloadedFiles(url: URL, completion: @escaping (URL) -> (Void)) {
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        
        let request = URLRequest(url: url)
        
        session.downloadTask(with: request) {(tempLocation, response, error) in
            
            if let tempUrlLocation = tempLocation {
                
                let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
                
                Zip.addCustomFileExtension("tmp")
                
                try? Zip.unzipFile(tempUrlLocation, destination: cachesDirectory, overwrite: true, password: nil, progress: { (progress) -> () in
                    
                    print(progress)
                    print("File is downloading...")
                    completion(cachesDirectory)
                }) // Unzip
                
            } else {
                print("Fail to download zip:", error?.localizedDescription ?? "Error")
            }
            
        }.resume()
        
    }
    
}




