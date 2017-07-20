//
//  PPBWord.swift
//  EnglishSpellingForKids
//
//  Created by phuong on 23/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit
import CoreData

class PPBWord: NSManagedObject {
    
    func setEntity(word: String, imageFile: String, category: String, note: String) {
        self.category = category
        self.imageFile = imageFile
        self.note = note
        self.word = word
       
    }
    public static func ==(lWord: PPBWord, rWord: PPBWord)-> Bool{
        return lWord.word == rWord.word
    }
    /*
    class func findOrCreatedPPBWord(matching wordInfo: PPBWord, in context: NSManagedObjectContext) throws -> PPBWord {
        let request : NSFetchRequest<PPBWord> = PPBWord.fetchRequest() as! NSFetchRequest<PPBWord>
     //   request.predicate = NSPredicate(format: "word = %@",wordInfo.word)
        do {
            let matches = try context.fetch(request)
            if matches.count > 0 {
                assert(matches.count > 1, "This word already existed")
                return matches[0]
            }
        }catch {
            throw error
        }
        let word = PPBWord(context: context)
        word.word = wordInfo.word
        word.category = wordInfo.category
        word.imageFile = wordInfo.imageFile
        word.note = wordInfo.note
        return word
    }
    
*/
}
