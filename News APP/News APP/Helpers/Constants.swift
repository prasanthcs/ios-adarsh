//
//  Constants.swift
//  News APP
//
//  Created by ADARSH KC on 17/06/20.
//  Copyright © 2020 ADARSH KC. All rights reserved.
//


import Foundation

let APIKEY_TO_SERVER = "cb1f0fb796f94809978737809a791809"

let COUNTRYCODE_TO_SERVER = "in"

var CATEGORY_TO_SERVER = ""

struct Constants {
    
    struct URLs {
        static var topHeadlines : String{
            
            get{
                
                return "https://newsapi.org/v2/top-headlines?country=\(COUNTRYCODE_TO_SERVER)&category=\(CATEGORY_TO_SERVER)&apiKey=\(APIKEY_TO_SERVER)"
                
            }
        }
    }
    
}
