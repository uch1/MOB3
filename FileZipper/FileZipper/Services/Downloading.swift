//
//  Downloading.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/23/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import Foundation
import Zip

class Downloading {
    // Singleton
    static var shared = Downloading()
    
    // Fetching the content from the unzipped files
    func downloadingFiles(url: URL?, completion: @escaping (URL) -> Void) {
        
        guard let fileURL = url else { return }
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        
        let request = URLRequest(url: fileURL)
        
        session.downloadTask(with: request) {(tempLocation, response, error) in
            
            if let tempUrlLocation = tempLocation, error == nil {
                
                let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
                do {
                    
                    Zip.addCustomFileExtension("tmp")
                    
                    try Zip.unzipFile(tempUrlLocation, destination: cachesDirectory, overwrite: true, password: nil, progress: { (progress) -> () in
                        
                        print(progress)
                        print("File is downloading...")
                        
                    }) // Unzip
                    
                    completion(cachesDirectory)
                    
                } catch let zipError {
                    print("Failed to download zipfile:", zipError)
                }
                
                
            } else {
                print("Fail to download zip:", error?.localizedDescription ?? "Error")
            }
            
            }.resume()
    }
    
    
}
