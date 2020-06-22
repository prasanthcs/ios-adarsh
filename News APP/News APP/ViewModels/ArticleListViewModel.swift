//
//  ArticleListViewModel.swift
//  News APP
//
//  Created by ADARSH KC on 17/06/20.
//  Copyright © 2020 ADARSH KC. All rights reserved.
//


import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article)
    }
    
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
  
    var urlToImage : String{
        return self.article.urlToImage
    }
    
    var url : String{
        return self.article.url
    }
    
}

