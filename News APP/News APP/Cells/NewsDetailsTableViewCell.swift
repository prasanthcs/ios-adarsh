//
//  NewsDetailsTableViewCell.swift
//  News APP
//
//  Created by ADARSH KC on 17/06/20.
//  Copyright © 2020 ADARSH KC. All rights reserved.
//

import UIKit
import SDWebImage

class NewsDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet var mainContainerView: UIView!
    
    @IBOutlet var imageview: UIImageView!
    
    @IBOutlet var newsLAbel: UILabel!
    
    @IBOutlet var titleLabel: UILabel!
    
    static var reuseIdentifier = String(describing: NewsDetailsTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        self.imageview.layer.cornerRadius = 10
        
        self.imageview.layer.masksToBounds = true
        
        self.imageview.contentMode = .scaleAspectFill
        
        self.imageview.clipsToBounds = true
        
        self.mainContainerView.layer.cornerRadius = 16.0
        self.mainContainerView.layer.borderWidth = 0.0
        self.mainContainerView.layer.shadowColor = UIColor.lightGray.cgColor
        self.mainContainerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.mainContainerView.layer.shadowRadius = 2.0
        self.mainContainerView.layer.shadowOpacity = 1
        self.mainContainerView.layer.masksToBounds = false
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(article : ArticleViewModel){
        
        addLineSpacing(view:  self.newsLAbel, text: article.description)
        
        addLineSpacing(view:  self.titleLabel, text: article.title)
        
        self.imageview.sd_setImage(with: URL(string: article.urlToImage), placeholderImage: UIImage(named: "empty_result"))

        
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
