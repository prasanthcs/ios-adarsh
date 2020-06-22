//
//  CategoryViewController.swift
//  News APP
//
//  Created by ADARSH KC on 17/06/20.
//  Copyright © 2020 ADARSH KC. All rights reserved.
//


import UIKit

protocol CategorySelectionDelegate {
    
    func didSelectCategory(category : String)
}

class CategoryViewController: UIViewController {
    
    private let spacing:CGFloat = 16.0
    
    @IBOutlet var collectionView: UICollectionView!
    
    var titleArray = ["All","Business","Entertainment","General","Health","Science","Sports","Technology"]
    
    var categoryArray = ["","business","entertainment","general","health","science","sports","technology"]
    
    var currentCategorySelectionCode = ""
    
     var currentCategorySelectionTitle = "All"
    
    var imageArray = [UIImage(named: "all_icon"),UIImage(named: "business_icon"),UIImage(named: "entertainment_icon"),UIImage(named: "general_icon"),UIImage(named: "health_icon"),UIImage(named: "science_icon"),UIImage(named: "sports_icon"),UIImage(named: "tech_icon")]
    
    var descriptionText = "Tap to view"
    
    var categorySelectionDelegate : CategorySelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
       self.title = "Categories"
        
        initCollectionView()
        
        configureLayout()
        
        addBackButton()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        configureLayout()
    }
    
    func addBackButton() {
        
        self.navigationItem.hidesBackButton = true
        
        let backbutton = UIBarButtonItem.initBarButtonItem(target: self, action: #selector(dismissAction),titleText: "")
        
          backbutton.image = UIImage(named: "nav_back")
        
        backbutton.tintColor = .white
        
        self.navigationItem.leftBarButtonItem = backbutton
        
    }
    
    @IBAction func dismissAction(){
        
          //self.navigationController?.popViewController(animated: true)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func initCollectionView(){
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
    }
    
    func configureLayout(){
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
        
    }
    
    
}

extension CategoryViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.configure(title: titleArray[indexPath.row], description: descriptionText, image: imageArray[indexPath.row]!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        currentCategorySelectionCode = categoryArray[indexPath.row]
        
        currentCategorySelectionTitle = titleArray[indexPath.row]
        
        CATEGORY_TO_SERVER = currentCategorySelectionCode
        
        loadNews()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 16
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: 120)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    
    func loadNews(){
        
        if let delegate = categorySelectionDelegate{
            
            dismissAction()
            
            delegate.didSelectCategory(category: currentCategorySelectionTitle)
        }
       
    }
    
}

