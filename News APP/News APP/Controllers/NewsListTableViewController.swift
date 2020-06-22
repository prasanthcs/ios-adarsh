//
//  NewsListTableViewController.swift
//  News APP
//
//  Created by ADARSH KC on 17/06/20.
//  Copyright © 2020 ADARSH KC. All rights reserved.
//


import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    var categoryButton = UIBarButtonItem()
    
    var uiBusyIndicator = UIActivityIndicatorView(style: .gray)
    
    var currentCategorySelection = "All"
    
    var selectedCategorySelection = "All"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.tableView.separatorStyle = .none
        
        self.tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0);
        
        setCategorySelection(isLoading: false,title: currentCategorySelection)
        
        initTableView()
        
        loadNews()
        
        
    }
    
    func initTableView(){
       
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadNews), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
    }
    
    func setCategorySelection(isLoading : Bool,title : String){
        
        DispatchQueue.main.async {
            
            self.uiBusyIndicator.hidesWhenStopped = true
        }
        
        let UiBusyBarButton = UIBarButtonItem(customView: uiBusyIndicator)
        
        categoryButton = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(moveToCategorySelection))
        
        categoryButton.tintColor = .white
        
        if isLoading{
            
             uiBusyIndicator.startAnimating()
                    
            self.navigationItem.rightBarButtonItems = [UiBusyBarButton]
            
        }else{
            
            DispatchQueue.main.async {
                
                self.uiBusyIndicator.stopAnimating()
            }
            
            DispatchQueue.main.async {
                
                self.navigationItem.rightBarButtonItems = [self.categoryButton]
            }
            
            
        }
        
       
    }
    
    @objc func moveToCategorySelection(){
        
        let categoryVC: CategoryViewController = CategoryViewController.instantiate(appStoryboard: .main)
        categoryVC.modalPresentationStyle = .fullScreen
        
        categoryVC.categorySelectionDelegate = self
        
        let NavigationVc = UINavigationController(rootViewController: categoryVC)
        NavigationVc.modalPresentationStyle = .fullScreen
        self.present(NavigationVc, animated: true, completion: nil)
       
    }
    
    @objc private func loadNews() {
        
        self.setCategorySelection(isLoading: true,title: currentCategorySelection)
        
        Webservice().getArticles(with: URL.urlForTopHeadlines()) { articles in
            
            DispatchQueue.main.async {
                
                self.tableView.refreshControl?.endRefreshing()
                
            }
            
            if let articles = articles {
                
                self.currentCategorySelection = self.selectedCategorySelection
                
                self.setCategorySelection(isLoading: false,title: self.selectedCategorySelection)
                
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
                
            }else{
                
                self.setCategorySelection(isLoading: false,title: self.currentCategorySelection)
                
                self.noDataAlert()
            }
            
        }
        
    }
    
    
    func noDataAlert(){
        
        let alert = UIAlertController(title: "NEWS", message: "No News found in this category or unable to fetch data , check your network", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                    print("default")

              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")


        }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
          return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found!")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.configure(for: articleVM)
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        moveToDetails(article: articleVM)
        
    }
    
    func moveToDetails(article : ArticleViewModel){
        
        let newsDetailsVC : NewsDetailsTableViewController = NewsDetailsTableViewController.instantiate(appStoryboard: .main)
        newsDetailsVC.modalPresentationStyle = .fullScreen
        
        newsDetailsVC.article = article
        
        let NavigationVc = UINavigationController(rootViewController: newsDetailsVC)
        NavigationVc.modalPresentationStyle = .fullScreen
        self.present(NavigationVc, animated: true, completion: nil)
        
    }
}

extension NewsListTableViewController : CategorySelectionDelegate{
    
    func didSelectCategory(category: String) {
        
        selectedCategorySelection = category
        
        loadNews()
    }
 
}


