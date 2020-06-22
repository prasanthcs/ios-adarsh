//
//  CollectionViewCell.swift
//  News APP
//
//  Created by ADARSH KC on 17/06/20.
//  Copyright © 2020 ADARSH KC. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var mainContainerView: UIView!
    
    @IBOutlet var imageContainerView: UIView!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    static var reuseIdentifier = String(describing: CollectionViewCell.self)
    
    override func awakeFromNib() {
        
        imageContainerView.layer.cornerRadius = 8
         imageContainerView.layer.masksToBounds = true
        imageContainerView.applyGradient(colours: [hexStringToUIColor(hex: "#74D1A1"),hexStringToUIColor(hex: "#18AA60")])
        mainContainerView.layer.cornerRadius = 16.0
        mainContainerView.layer.borderWidth = 0.0
        mainContainerView.layer.shadowColor = UIColor.lightGray.cgColor
        mainContainerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        mainContainerView.layer.shadowRadius = 2.0
        mainContainerView.layer.shadowOpacity = 1
        mainContainerView.layer.masksToBounds = false
        
        titleLabel.font = titleLabel.font.withSize(16)
        
        descriptionLabel.font = descriptionLabel.font.withSize(12)
        
        descriptionLabel.textColor = hexStringToUIColor(hex: "#18AA60")
        
    }
 
    
    func configure(title : String,description : String,image : UIImage){
        
        imageView.image = image
        
        titleLabel.text = title
        
        descriptionLabel.text = description
       
    }
    
}
