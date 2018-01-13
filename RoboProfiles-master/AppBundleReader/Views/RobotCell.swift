//
//  RobotsCell.swift
//  AppBundleReader
//
//  Created by Uchenna  Aguocha on 1/13/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit

class RobotCell: UITableViewCell {
    
    var robot: Robot? {
        didSet {
            
            nameLabel.text = robot?.name
            //print(nameLabel.text ?? "")
            
//            if let robotImage = robot?.image  {
//                robotImageView.image = UIImage(named: robotImage)
//            }
            guard let unwrappedImageURL = robot?.image else { return }
            if let robotImageData = try? Data(contentsOf: unwrappedImageURL) {
                robotImageView.image = UIImage(data: robotImageData)
            }
            
        }
    }
    
    let robotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = UIColor.lightBlue
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.darkGrayBlue.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        //label.text = "Name"
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.tealColor
        setupCellLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellLayout() {
        
        addSubview(robotImageView)
        robotImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        robotImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        robotImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        robotImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: robotImageView.rightAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}
