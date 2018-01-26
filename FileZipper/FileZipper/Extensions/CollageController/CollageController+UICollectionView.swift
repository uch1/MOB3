//
//  CollageController+UICollectionView.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/21/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

extension CollageController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return collageImages.count
        return collageImages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollageCell
        //let unzippedImage = imageCollection[indexPath.item]
        let collageImage = collageImages[indexPath.item]
        //cell.categoryLabel.text = collageImage.collectionName
        cell.backgroundColor = .white
        cell.category = collageImage
//        cell.categoryLabel.text = collageImage.collectionName
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collageImage = collageImages[indexPath.item]
        
        let layout = UICollectionViewFlowLayout()
        let photoCollectionController = PhotoCollectionController(collectionViewLayout: layout)
        photoCollectionController.folderImages = collageImage
        
        //let navController = UINavigationController(rootViewController: photoCollectionController)
        navigationController?.pushViewController(photoCollectionController, animated: true)
        
        //present(navController, animated: true, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 325, height: 225)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
}
