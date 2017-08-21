//
//  Section.swift
//  EnglishSpelling
//
//  Created by phuong on 21/8/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import Foundation

struct Section{
    var category: String!
    var words: [PPBWord]!
    var expandable: Bool!
    init(category: String, words: [PPBWord], expandable: Bool){
        self.category = category
        self.words = words
        self.expandable = expandable
        
    }
}
