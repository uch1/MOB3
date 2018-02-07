//
//  InventoryCell.swift
//  VeganProductInventory
//
//  Created by Uchenna  Aguocha on 2/6/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class InventoryCell: UITableViewCell {
    
    var inventory: Inventory? {
        didSet {
            
            productInfoLabel.text = inventory?.name
            
            guard let name = inventory?.name else { return }
            guard let quantity = inventory?.quantity else { return }
            
            if let productDate = inventory?.date {
                // Create date formatter using this format: MMM dd, yyyy
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM dd, yyyy"
                
                // Convert Date type to a String type 
                let productDateString = dateFormatter.string(from: productDate)
                
                let dateString = "\(name) - Quantity: \(quantity) \(productDateString)"
                
                productInfoLabel.text = dateString
                
            } else {
                productInfoLabel.text = inventory?.name
            }
            
        }
    }
    
    
    let productInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Inventory Item"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.white
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.cyan
        setupCellLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCellLayout() {
        
        addSubview(productInfoLabel)
        productInfoLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
    }
}
