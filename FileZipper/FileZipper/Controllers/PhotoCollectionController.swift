//
//  PhotosCollectionController.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/24/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class PhotoCollectionController: UICollectionViewController {
    
    let cellId = "cellId"
    
    var folderImages: ImageCollection?
    
    var unzippedImageUrl: URL?
    var photos = [URL]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        extendedLayoutIncludesOpaqueBars = false
        
        navigationItem.title = "Photos"
        
        setupCollectionViewLayout()
        
        unzippedImageUrl = folderImages?.unzippedImagesURL
        // Note: Data has been retrieved and stored in jpegImageUrls as well as photo array 
        guard let jpegImageUrls = getImageUrls(url: unzippedImageUrl) else { return }
        photos = jpegImageUrls
        
    }
    

    
    func setupCollectionViewLayout() {
        collectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.backgroundColor = .yellow
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .vertical
        layout?.minimumLineSpacing = 0
    }
    
    private func getImageUrls(url: URL?) -> [URL]? {
        do {
            guard let url = url else {return nil}
            
            //get all contents in a folder
            let directoryContents = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [])
            
            //filering all contents by path extension
            let jpegFiles = directoryContents.filter{ $0.pathExtension == "jpg" || $0.pathExtension == "jpeg"}
            
            return jpegFiles
        } catch {
            print("\(error)")
        }
        return nil
    }
    
    func loadImage(fileURL: URL?) -> UIImage? {
        
        do {
            guard let fileURL = fileURL else { return nil}
            
            let imageData = try Data(contentsOf: fileURL)
            
            return UIImage(data: imageData)
            
        } catch {
            print("Error loading image: \(error)")
        }
        
        return nil
    }
    
}
