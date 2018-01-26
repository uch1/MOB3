//
//  ViewController.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/17/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit
import Zip

class CollageController: UICollectionViewController {
    let cellId = "cellId"
    
    var collageImages = [ImageCollection]()
//    var zippedUrlImage: ImageCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Categories"
        
        collectionView?.backgroundColor = .red
        collectionView?.register(CollageCell.self, forCellWithReuseIdentifier: cellId)
        fetchingPreviewImages()
        
        
    }
    
    // MARK: - Methods
    func fetchingPreviewImages() {
        
        Networking.shared.fetch { (data) in
            if let decodedImageCollection = try? JSONDecoder().decode([ImageCollection].self, from: data) {
                self.collageImages = decodedImageCollection
            }
            self.downloadingZipFiles()
        }
    }
    
    
    func downloadingZipFiles() {
        
        //        guard let unwrappedZippedImageURL = zippedUrlImage as? String else { return }
        var index = 0
        for collage in self.collageImages {
            
            //guard let unwrappedZipFile = zippedUrlImage?.zippedImagesURL else { return }
            
            Downloading.shared.downloadingFiles(url: collage.zippedImagesURL, completion: { (url) in
                
                DispatchQueue.main.async {
                    
                    guard let unwrappedZippedImagesURL = self.collageImages[index].zippedImagesURL else { return }
                
                    let fileName = unwrappedZippedImagesURL.deletingPathExtension().lastPathComponent.replacingOccurrences(of: "+", with: " ")
                    print("\(fileName) trying to download....")
                
                    self.collageImages[index].unzippedImagesURL = url.appendingPathComponent(fileName)
                
                    index += 1
                    
                    self.collectionView?.reloadData()
                }
            })
            
        }
        
    }
    
    private func loadImage(fileURL: URL?) -> UIImage? {
        
        do {
            guard let fileURL = fileURL else { return nil}
            
            let imageData = try Data(contentsOf: fileURL)
            
            return UIImage(data: imageData)
            
        } catch {
            print("Error loading image: \(error)")
        }
        
        return nil
    }
    
    //    func fetchingDownloadedImages() {
    //        guard let zippedImage = otherImages?.zippedImagesURL else { return }
    //        Networking.shared.fetchDownloadedFiles(url: zippedImage) { (url) in
    //
    //            let urlString = url.lastPathComponent.split(separator: ".")[0]
    //            print(urlString)
    //
    //            let fileURL = try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("\(urlString)_preview.png")
    //            print(fileURL)
    //
    //            DispatchQueue.main.async {
    //                guard let imageURL = fileURL?.path else { return }
    //            }
    //        }
    //
    //    }
    
}

