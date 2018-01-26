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
        imageView.contentMode = .scaleAspectFill
        //imageView.backgroundColor = .green
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
//        label.text = "Swimming"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .orange
        setupCellLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupCellLayout() {
        
        addSubview(collageImageView)
        collageImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collageImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collageImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collageImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true 
        //collageImageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        
        
        addSubview(categoryLabel)
        
        categoryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        categoryLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        
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
