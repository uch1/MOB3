//
//  PhotoCell.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/24/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        //imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 25
        imageView.layer.borderColor = UIColor.black.cgColor
//        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "EXAMPLEEEEEE"
        //label.backgroundColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.imageView?.image = #imageLiteral(resourceName: "if_Heart_2202276")
        button.setImage(#imageLiteral(resourceName: "if_Heart_2202276"), for: .normal)
        button.showsTouchWhenHighlighted = true
        //button.backgroundColor = .white
        return button
    }()
    
    let chatButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "if_Chat_bubble_2202260"), for: .normal)
        button.showsTouchWhenHighlighted = true
//        button.backgroundColor = .orange
        return button
    }()
    
    let paperPlaneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "if_paper-plane-1_430109"), for: .normal)
        button.showsTouchWhenHighlighted = true
       // button.backgroundColor = .yellow
        return button
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "if_Bookmark_2202257"), for: .normal)
        button.showsTouchWhenHighlighted = true
        //button.backgroundColor = .black
        return button
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
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        addSubview(profileNameLabel)
        profileNameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor).isActive = true
        profileNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16).isActive = true
        profileNameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        addSubview(heartButton)
        heartButton.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 16).isActive = true
        heartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        heartButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        heartButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        addSubview(chatButton)
        chatButton.topAnchor.constraint(equalTo: heartButton.topAnchor).isActive = true
        chatButton.leadingAnchor.constraint(equalTo: heartButton.trailingAnchor, constant: 16).isActive = true
        chatButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        chatButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        addSubview(paperPlaneButton)
        paperPlaneButton.topAnchor.constraint(equalTo: heartButton.topAnchor).isActive = true
        paperPlaneButton.leadingAnchor.constraint(equalTo: chatButton.trailingAnchor, constant: 16).isActive = true
        paperPlaneButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        paperPlaneButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(bookmarkButton)
        bookmarkButton.topAnchor.constraint(equalTo: heartButton.topAnchor).isActive = true
        bookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        bookmarkButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        bookmarkButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
}
