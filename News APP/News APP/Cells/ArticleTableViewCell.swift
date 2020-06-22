//
//  ArticleTableViewCell.swift
//  News APP
//
//  Created by ADARSH KC on 17/06/20.
//  Copyright © 2020 ADARSH KC. All rights reserved.
//


import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet var containerView: UIView!
    
    override func awakeFromNib() {
        
        self.selectionStyle = .none
        
        containerView.layer.cornerRadius = 10.0
        containerView.layer.borderWidth = 0.0
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 2.0
        containerView.layer.shadowOpacity = 1
        containerView.layer.masksToBounds = false
        
    }
    
    func configure(for vm: ArticleViewModel) {
        
        addLineSpacing(view: self.titleLabel, text: vm.title)
        
        addLineSpacing(view: self.descriptionLabel, text: vm.description)
       
//        self.titleLabel.text = vm.title
//        self.descriptionLabel.text = vm.description
    }
    
    func addLineSpacing(view : UILabel,text : String){
        
        let attributedString = NSMutableAttributedString(string: text)

        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()

        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points

        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        // *** Set Attributed String to your label ***
        view.attributedText = attributedString
    }
    

    
}

