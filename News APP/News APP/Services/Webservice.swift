//
//  Webservice.swift
//  News APP
//
//  Created by ADARSH KC on 17/06/20.
//  Copyright © 2020 ADARSH KC. All rights reserved.
//


import Foundation

class Webservice {
    
    func getArticles(with url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articlesList = try? JSONDecoder().decode(ArticleList.self, from: data)
                completion(articlesList?.articles)
            }
            
        }.resume()
        
    }
    
}
