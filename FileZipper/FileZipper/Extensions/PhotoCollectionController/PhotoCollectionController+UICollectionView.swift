//
//  PhotoCollectionController+UICollectionView.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/24/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import Foundation
import UIKit


extension PhotoCollectionController: UICollectionViewDelegateFlowLayout  {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PhotoCell
        //let photo = photos[indexPath.item]
        
        //cell.profileImageView.image = loadImage(fileURL: photo.appendingPathComponent("_preview.png"))
        cell.profileNameLabel.text = folderImages?.collectionName
        cell.photoImageView.image = loadImage(fileURL: photos[indexPath.item])
        print("\(String(describing: cell.photoImageView.image))")
        //cell.photo = photo
        
        //cell.backgroundColor = .blue
        return cell 
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    
}


