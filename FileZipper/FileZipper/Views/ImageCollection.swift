//
//  ImageCollection.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/20/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import Foundation

struct ImageCollection {
    var collectionName: String?
    var zippedImagesURL: URL?
    var unzippedImagesURL: URL?
    //var previewImage: URL?
    
//    init(collectionName: String?, zippedImagesURL: String?) {
//        self.collectionName = collectionName
//        self.zippedImagesURL = zippedImagesURL
//    }
}

extension ImageCollection: Decodable {
    
    enum ImageCollectionKeys: String, CodingKey {
        case collectionName = "collection_name"
        case zippedImagesURL = "zipped_images_url"
    }
    
    init(from decoder: Decoder) throws {
        let imageCollectionContainer = try decoder.container(keyedBy: ImageCollectionKeys.self)
        
        let collectionName = try imageCollectionContainer.decode(String.self, forKey: .collectionName)
        let zippedImagesURL = try imageCollectionContainer.decode(URL.self, forKey: .zippedImagesURL)
        
        //self.init(collectionName: collectionName, zippedImagesURL: zippedImagesURL)
        self.init(collectionName: collectionName, zippedImagesURL: zippedImagesURL, unzippedImagesURL: nil)
    }
    
}
