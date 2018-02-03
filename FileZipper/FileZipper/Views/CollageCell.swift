//
//  CollageCell.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/21/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class CollageCell: UICollectionViewCell {
    
    // MARK: - Properties
    var category: ImageCollection? {
        didSet {

            categoryLabel.text = category?.collectionName
            
            if let previewImage = loadImage(fileURL: category?.unzippedImagesURL?.appendingPathComponent("_preview.png")) {
                collageImageView.image = previewImage
            }
            
        }
    }
    
    
    private let collageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = CGSize.zero
        imageView.layer.shadowRadius = 10
        imageView.layer .shadowPath = UIBezierPath(rect: imageView.bounds).cgPath
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.shadowColor = .black
        label.shadowOffset = CGSize.zero
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCellLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupCellLayout() {
        
        addSubview(collageImageView)
        collageImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collageImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collageImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collageImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true 
        //collageImageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        
        
        addSubview(categoryLabel)
        categoryLabel.leftAnchor.constraint(equalTo: collageImageView.leftAnchor, constant: 25).isActive = true
        categoryLabel.rightAnchor.constraint(equalTo: collageImageView.rightAnchor, constant: -20).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: collageImageView.bottomAnchor, constant: -20).isActive = true
        
        
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
    
}
