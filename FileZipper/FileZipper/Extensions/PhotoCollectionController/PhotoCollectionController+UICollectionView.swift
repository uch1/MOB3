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
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PhotoCell
        
        let photo = photos[indexPath.item]
        
        //cell.profileImageView.image = loadImage(fileURL: photo.appendingPathComponent("_preview.png"))
        cell.profileImageView.image = #imageLiteral(resourceName: "_preview")
        cell.profileNameLabel.text = folderImages?.collectionName
        cell.photoImageView.image = loadImage(fileURL: photo)
        //cell.profileNameLabel.text = folderImages?.collectionName
//        cell.photoImageView.image = loadImage(fileURL: photo)
//        print("\(String(describing: cell.photoImageView.image))")
        
        
        //cell.photo = photo
        
        cell.backgroundColor = .white
        return cell 
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 6
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


