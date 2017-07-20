//
//  PPBenWord.swift
//  EnglishSpellingForKids
//
//  Created by phuong on 23/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import AudioToolbox

enum PPBCategory: String {
    case fruit
    case homeware
    case furniture
    case people
    case animal
    
    var value: String {
        switch self {
        case .fruit:
            return "Fruit"
        case .homeware:
            return "Homeware"
        case .furniture:
            return "Furniture"
        case .animal:
            return "Animal"
        default:
            return "People"
        }
    }
    var categories:[PPBCategory]{
        return  [PPBCategory.fruit, PPBCategory.furniture, PPBCategory.homeware,PPBCategory.animal, PPBCategory.people]
    }
    
}

class PPBWordService {

    static var doneItems: [PPBWord] = []
    var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
     var  context: NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    func initFruitData() -> [PPBWord]{
        var data : [PPBWord] = []
        if let context = self.context {
            let apple = PPBWord.init( context: context)
            apple.setEntity(word: "apple", imageFile: "apple.png", category: PPBCategory.fruit.value, note: "")
            data.append(apple)
            
            let grape = PPBWord.init(context: context)
                grape.setEntity( word: "grape", imageFile: "grape.png", category: PPBCategory.fruit.value, note: "")
            data.append(grape)
            
            let banana = PPBWord.init(context: context)
            banana.setEntity(word: "banana", imageFile: "banana.png", category: PPBCategory.fruit.value, note: "")
            data.append(banana)
            
            let strawberry = PPBWord.init(context: context)
            strawberry.setEntity (word: "strawberry", imageFile: "strawberry.png", category: PPBCategory.fruit.value, note: "")
            data.append(strawberry)
            
            let avocado = PPBWord.init(context: context)
            avocado.setEntity (word: "avocado", imageFile: "avocado.png", category: PPBCategory.fruit.value, note: "")
            data.append(avocado)
            
            let cherry = PPBWord.init(context: context)
            cherry.setEntity(word: "cherry", imageFile: "cherry.png", category: PPBCategory.fruit.value, note: "")
            data.append(cherry)
            
            let kiwi = PPBWord.init(context: context)
            kiwi.setEntity(word: "kiwi", imageFile: "kiwi.png", category: PPBCategory.fruit.value, note: "")
            data.append(kiwi)
            
            let lemon = PPBWord.init(context: context)
            lemon.setEntity (word: "lemon", imageFile: "lemon.png", category: PPBCategory.fruit.value, note: "")
            data.append(lemon)
            
            let lime = PPBWord.init(context: context)
            lime.setEntity (word: "lime", imageFile: "lime.png", category: PPBCategory.fruit.value, note: "")
            data.append(lime)
            
            let orange = PPBWord.init(context: context)
            orange.setEntity(word: "orange", imageFile: "orange.png", category: PPBCategory.fruit.value, note: "")
            data.append(orange)
            
            let pear = PPBWord.init(context: context)
             pear.setEntity(word: "pear", imageFile: "pear.png", category: PPBCategory.fruit.value, note: "")
            data.append(pear)
            
            let plum = PPBWord.init(context: context)
            plum.setEntity(word: "plum", imageFile: "plum.png", category: PPBCategory.fruit.value, note: "")
            data.append(plum)
            
            let pomegranate = PPBWord.init(context: context)
            pomegranate.setEntity (word: "pomegranate", imageFile: "pomegranate.png", category: PPBCategory.fruit.value, note: "")
            data.append(pomegranate)
            
            let walnut = PPBWord.init(context: context)
            walnut.setEntity (word: "walnut", imageFile: "walnut.png", category: PPBCategory.fruit.value, note: "")
            data.append(walnut)
            
            let watermelon = PPBWord.init(context: context)
            watermelon.setEntity (word: "watermelon", imageFile: "watermelon.png", category: PPBCategory.fruit.value, note: "")
            data.append(watermelon)
        }
        return data
        
    }
    func initAnimalData() -> [PPBWord]{
        var data : [PPBWord] = []
        if let context = self.context {
            
            let bat = PPBWord.init(context: context)
            bat.setEntity (word: "bat", imageFile: "bat.png", category: PPBCategory.animal.value, note: "")
            data.append(bat)
            
            let bear = PPBWord.init(context: context)
            bear.setEntity (word: "bear", imageFile: "bear.png", category: PPBCategory.animal.value, note: "")
            data.append(bear)
            
            let buffalo = PPBWord.init(context: context)
            buffalo.setEntity (word: "buffalo", imageFile: "buffalo.png", category: PPBCategory.animal.value, note: "")
            data.append(buffalo)
            
            let bulldog = PPBWord.init(context: context)
            bulldog.setEntity (word: "bulldog", imageFile: "bulldog.png", category: PPBCategory.animal.value, note: "")
            data.append(bulldog)
            
            let cat = PPBWord.init(context: context)
            cat.setEntity (word: "cat", imageFile: "cat.png", category: PPBCategory.animal.value, note: "")
            data.append(cat)
            
            let cheetah = PPBWord.init(context: context)
            cheetah.setEntity (word: "cheetah", imageFile: "cheetah.png", category: PPBCategory.animal.value, note: "")
            data.append(cheetah)
            
            let chicken = PPBWord.init(context: context)
            chicken.setEntity (word: "chicken", imageFile: "chicken.png", category: PPBCategory.animal.value, note: "")
            data.append(chicken)
            
            let cow = PPBWord.init(context: context)
            cow.setEntity(word: "cow", imageFile: "cow.png", category: PPBCategory.animal.value, note: "")
            data.append(cow)
            
            let crab = PPBWord.init(context: context)
            crab.setEntity(word: "crab", imageFile: "crab.png", category: PPBCategory.animal.value, note: "")
            data.append(crab)
            
            let crocodile = PPBWord.init(context: context)
            crocodile.setEntity(word: "crocodile", imageFile: "crocodile.png", category: PPBCategory.animal.value, note: "")
            data.append(crocodile)
            
            let crow = PPBWord.init(context: context)
            crow.setEntity(word: "crow", imageFile: "crow.png", category: PPBCategory.animal.value, note: "")
            data.append(crow)
            
            let deer = PPBWord.init(context: context)
            deer.setEntity(word: "deer", imageFile: "deer.png", category: PPBCategory.animal.value, note: "")
            data.append(deer)
            
            let dog = PPBWord.init(context: context)
            dog.setEntity(word: "dog", imageFile: "dog.png", category: PPBCategory.animal.value, note: "")
            data.append(dog)
            
            let dolphin = PPBWord.init(context: context)
            dolphin.setEntity(word: "dolphin", imageFile: "dolphin.png", category: PPBCategory.animal.value, note: "")
            data.append(dolphin)
            
            let duck = PPBWord.init(context: context)
            duck.setEntity(word: "duck", imageFile: "duck.png", category: PPBCategory.animal.value, note: "")
            data.append(duck)
            
            let eagle = PPBWord.init(context: context)
            eagle.setEntity(word: "eagle", imageFile: "eagle.png", category: PPBCategory.animal.value, note: "")
            data.append(eagle)
            
            let elephant = PPBWord.init(context: context)
            elephant.setEntity(word: "elephant", imageFile: "elephant.png", category: PPBCategory.animal.value, note: "")
            data.append(elephant)
            
            let fish = PPBWord.init(context: context)
            fish.setEntity(word: "fish", imageFile: "fish.png", category: PPBCategory.animal.value, note: "")
            data.append(fish)
            
            let fox = PPBWord.init(context: context)
            fox.setEntity(word: "fox", imageFile: "fox.png", category: PPBCategory.animal.value, note: "")
            data.append(fox)
            
            let horse = PPBWord.init(context: context)
            horse.setEntity(word: "horse", imageFile: "horse.png", category: PPBCategory.animal.value, note: "")
            data.append(horse)
            
            let kangaroo = PPBWord.init(context: context)
            kangaroo.setEntity(word: "kangaroo", imageFile: "kangaroo.png", category: PPBCategory.animal.value, note: "")
            data.append(kangaroo)
            
            let lion = PPBWord.init(context: context)
            lion.setEntity(word: "lion", imageFile: "lion.png", category: PPBCategory.animal.value, note: "")
            data.append(lion)
            
            let monkey = PPBWord.init(context: context)
            monkey.setEntity(word: "monkey", imageFile: "monkey.png", category: PPBCategory.animal.value, note: "")
            data.append(monkey)
            
            let penguin = PPBWord.init(context: context)
            penguin.setEntity(word: "penguin", imageFile: "penguin.png", category: PPBCategory.animal.value, note: "")
            data.append(penguin)
        }
        return data
        
    }
    func chooseRandomWord(words: [PPBWord]) -> PPBWord{
        if PPBWordService.doneItems.count == words.count {
            PPBWordService.doneItems = []
        }
        while true {
            let random = Int(arc4random_uniform(UInt32(words.count)))
            if  !PPBWordService.doneItems.contains(words[random]){
                return words[random]
            }
        }
    }
    func playSound(filename: String, repeat: Bool){
        let ext = "wav"
        if let soundURL = Bundle.main.url(forResource: filename, withExtension: ext){
            var soundId: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundId)
            
            AudioServicesAddSystemSoundCompletion(soundId, nil, nil, { (soundId, clientData) -> Void in
                AudioServicesDisposeSystemSoundID(soundId)
            }, nil)
            
            AudioServicesPlaySystemSound(soundId)
            
        }
    }
    func saveWords(withWord words: [PPBWord]){
        for word in words {
            if let context = word.managedObjectContext {
                do{
                    try context.save()
                }catch {
                    print("Canot create this word")
                }
            }
        }
    }
    
    func fetchData(){
        if let context = self.context{
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PPBWord")
            do{
                
                let ppbWords = try context.fetch(fetchRequest)
                for w in ppbWords {
                    if let word = w as? PPBWord{
                        print(word.word!)
                     
                    }
                }
            }catch{
                print("fetching error")
            }
 
        }
    }
    
    
    
}

