//
//  URL+Extensions.swift
//  News APP
//
//  Created by ADARSH KC on 17/06/20.
//  Copyright © 2020 ADARSH KC. All rights reserved.
//


import Foundation
import UIKit

extension URL {
    
    static func urlForTopHeadlines() -> URL {
        return URL(string: Constants.URLs.topHeadlines)!
    }
    
}
