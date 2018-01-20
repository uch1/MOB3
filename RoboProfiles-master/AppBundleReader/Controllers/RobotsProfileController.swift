//
//  RobotProfileController.swift
//  AppBundleReader
//
//  Created by Uchenna  Aguocha on 1/13/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit

class RobotsProfileController: UIViewController {
    
    var robot: Robot? {
        didSet {
            
            guard let unwrappedImageUrl = robot?.image else { return }
            if let robotImageData = try? Data(contentsOf: unwrappedImageUrl) {
                robotImageView.image = UIImage(data: robotImageData)
                //setupCircularImageStyle()
            }
            
            nameTextLabel.text = robot?.name
            
            personalityTextLabel.text = robot?.personality
            
            phraseTextLabel.text = robot?.phrase
            
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //guard let robotName = robot?.name else { return }
        navigationItem.title = "Robot's Profile"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.darkGrayBlue
        setupUI()
    }
    
//    private func setupCircularImageStyle() {
//        robotImageView.layer.cornerRadius = robotImageView.frame.width / 2
//        robotImageView.clipsToBounds = true
//        robotImageView.layer.borderColor = UIColor.darkGrayBlue.cgColor
//        robotImageView.layer.borderWidth = 2
//    }
    
    //MARK: - Custom UI Elements
    let lightBlueBackgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.lightBlue
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    
    let robotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.tealColor
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.darkGrayBlue.cgColor
        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        //label.textColor = .white
        label.text = "Name:"
        return label
    }()
    
    let nameTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.backgroundColor = .red
        //label.font = UIFont.boldSystemFont(ofSize: 16)
        //label.textColor = .white
        return label
    }()
    
    let personalityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Personality:"
        return label
    }()
    
    let personalityTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        //label.text = "Personality blaha nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn "
        return label
    }()
    
    let phraseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Phrase:"
        return label
    }()
    
    let phraseTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        //label.text = "Favorite Phrase"
        //label.text = "hello"
        return label
    }()
    
    private func setupUI() {
        // lightBlueBackgroundView
        view.addSubview(lightBlueBackgroundView)
        lightBlueBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBlueBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBlueBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBlueBackgroundView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        // robotImageView
        view.addSubview(robotImageView)
        robotImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        robotImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        robotImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        robotImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        // nameLabel
        view.addSubview(nameLabel)
        //nameLabel.backgroundColor = .red
        nameLabel.topAnchor.constraint(equalTo: robotImageView.bottomAnchor, constant: 16).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        // nameTextLabel
        view.addSubview(nameTextLabel)
        //nameTextLabel.backgroundColor = .blue
        nameTextLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        nameTextLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 16).isActive = true
        nameTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        nameTextLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        // personalityLabel
        view.addSubview(personalityLabel)
        //personalityLabel.backgroundColor = .red
        personalityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16).isActive = true
        personalityLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        personalityLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        personalityLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        // personalityTextLabel
        view.addSubview(personalityTextLabel)
        //personalityTextLabel.backgroundColor = .green
        personalityTextLabel.topAnchor.constraint(equalTo: personalityLabel.topAnchor).isActive = true
        personalityTextLabel.leftAnchor.constraint(equalTo: personalityLabel.rightAnchor, constant: 16).isActive = true
        personalityTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        personalityTextLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        // phraseLabel
        view.addSubview(phraseLabel)
        //phraseLabel.backgroundColor = .red
        phraseLabel.topAnchor.constraint(equalTo: personalityLabel.bottomAnchor, constant: 16).isActive = true
        phraseLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        phraseLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        phraseLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        // phraseTextLabel
        view.addSubview(phraseTextLabel)
        //phraseTextLabel.backgroundColor = .blue
        phraseTextLabel.topAnchor.constraint(equalTo: phraseLabel.topAnchor).isActive = true
        phraseTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        phraseTextLabel.leftAnchor.constraint(equalTo: phraseLabel.rightAnchor, constant: 16).isActive = true
        phraseTextLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    }
    
    
}
