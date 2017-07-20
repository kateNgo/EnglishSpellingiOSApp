//
//  PPBWord.swift
//  EnglishSpellingForKids
//
//  Created by phuong on 23/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit


class PPBWord: Equatable {
    
    var word: String
    var imageFile : String
    var note : String
    var category: PPBCategory
    init(){
        self.category = PPBCategory.fruit
        self.imageFile = ""
        self.note = ""
        self.word = ""
    }
    init(word: String, imageFile: String, category: PPBCategory, note: String) {
        self.category = category
        self.imageFile = imageFile
        self.note = note
        self.word = word
    }
    public static func ==(lWord: PPBWord, rWord: PPBWord)-> Bool{
        return lWord.word == rWord.word
    }
   
}
