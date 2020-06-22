//
//  Article.swift
//  News APP
//
//  Created by ADARSH KC on 17/06/20.
//  Copyright © 2020 ADARSH KC. All rights reserved.
//


import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
    let urlToImage: String
    let url: String
}


