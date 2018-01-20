//
//  ViewController.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/17/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class CollageController: UICollectionViewController {

    var imageCollection = [ImageCollection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Networking.shared.fetchImages { (data) in
            
            if let decodedImageCollection = try? JSONDecoder().decode([ImageCollection].self, from: data) {
                self.imageCollection = decodedImageCollection
            }
        }
    }


}

