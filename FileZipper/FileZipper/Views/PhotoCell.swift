//
//  PhotoCell.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/24/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    // MARK: - Properties
//    var photo: ImageCollection? {
//        didSet {
//            profileNameLabel.text = photo?.collectionName
//
//
//
//        }
//    }
    
    let profileView: UIView = {
        let pv = UIView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.backgroundColor = .yellow
        return pv
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "example"
        label.backgroundColor = .black
        return label
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .orange
        setupPhotoCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods 
    func setupPhotoCell() {
        
        addSubview(profileImageView)
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
        addSubview(profileNameLabel)
        profileNameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor).isActive = true
        profileNameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor).isActive = true
        profileNameLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        addSubview(photoImageView)
        photoImageView.backgroundColor = .orange
        photoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        photoImageView.topAnchor.constraint(equalTo: bottomAnchor, constant: 16).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
    }
    
}
