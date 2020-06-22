//
//  NewsDetailsTableViewController.swift
//  News APP
//
//  Created by ADARSH KC on 17/06/20.
//  Copyright © 2020 ADARSH KC. All rights reserved.
//

import UIKit

class NewsDetailsTableViewController: UITableViewController {
    
    var article : ArticleViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 68.0
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.separatorStyle = .none
        
          self.title = "News"
        
        addBackButton()
        
        
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
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let articleValue = article{
            return 1
        }else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsDetailsTableViewCell.reuseIdentifier, for: indexPath) as! NewsDetailsTableViewCell
        
        if let articleValue = article{
            
            cell.configure(article: articleValue)
            
        }
        
        return cell
        
    }
  
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

