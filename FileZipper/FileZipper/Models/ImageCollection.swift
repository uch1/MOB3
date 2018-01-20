//
//  ImageCollection.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/18/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

struct AnimalImageCollection {
    var collectionName: String?
    var zippedImagesURL: URL?
    //var unzippedImagesURL: URL?
}

extension AnimalImageCollection: Decodable {
    
    enum ImageCollectionKeys: String, CodingKey {
        case collectionName = "collection_name"
        case zippedImagesURL = "zipped_images_url"
    }
    
    init(from decoder: Decoder) throws {
        let imageCollectioncontainer = try decoder.container(keyedBy: ImageCollectionKeys.self)
        
        let collectionName = try imageCollectioncontainer.decode(String.self, forKey: .collectionName)
        let zippedImagesURL = try imageCollectioncontainer.decode(URL.self, forKey: .zippedImagesURL)
        
        self.init(collectionName: collectionName, zippedImagesURL: zippedImagesURL)
    }
    
}
