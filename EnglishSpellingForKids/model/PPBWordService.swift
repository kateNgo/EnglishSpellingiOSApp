//
//  PPBenWord.swift
//  EnglishSpellingForKids
//
//  Created by phuong on 23/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import Foundation
import UIKit

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
    static var fruit: [PPBWord] {
        var data : [PPBWord] = []
        let apple = PPBWord.init(word: "apple", imageFile: "apple.png", category: PPBCategory.fruit, note: "")
        data.append(apple)
        
        let grape = PPBWord.init( word: "grape", imageFile: "grape.png", category: PPBCategory.fruit, note: "")
        data.append(grape)
        
        let banana = PPBWord.init(word: "banana", imageFile: "banana.png", category: PPBCategory.fruit, note: "")
        data.append(banana)
        
        let strawberry = PPBWord.init(word: "strawberry", imageFile: "strawberry.png", category: PPBCategory.fruit, note: "")
        data.append(strawberry)
        
        let avocado = PPBWord.init (word: "avocado", imageFile: "avocado.png", category: PPBCategory.fruit, note: "")
        data.append(avocado)
        
        let cherry = PPBWord.init(word: "cherry", imageFile: "cherry.png", category: PPBCategory.fruit, note: "")
        data.append(cherry)
        
        let kiwi = PPBWord.init(word: "kiwi", imageFile: "kiwi.png", category: PPBCategory.fruit, note: "")
        data.append(kiwi)
        
        let lemon = PPBWord.init(word: "lemon", imageFile: "lemon.png", category: PPBCategory.fruit, note: "")
        data.append(lemon)
        
        let lime = PPBWord.init(word: "lime", imageFile: "lime.png", category: PPBCategory.fruit, note: "")
        data.append(lime)
        
        let orange = PPBWord.init(word: "orange", imageFile: "orange.png", category: PPBCategory.fruit, note: "")
        data.append(orange)
        
        let pear = PPBWord.init(word: "pear", imageFile: "pear.png", category: PPBCategory.fruit, note: "")
        data.append(pear)
        
        let plum = PPBWord.init(word: "plum", imageFile: "plum.png", category: PPBCategory.fruit, note: "")
        data.append(plum)
        
        let pomegranate = PPBWord.init(word: "pomegranate", imageFile: "pomegranate.png", category: PPBCategory.fruit, note: "")
        data.append(pomegranate)
        
        let walnut = PPBWord.init(word: "walnut", imageFile: "walnut.png", category: PPBCategory.fruit, note: "")
        data.append(walnut)
        
        let watermelon = PPBWord.init(word: "watermelon", imageFile: "watermelon.png", category: PPBCategory.fruit, note: "")
        data.append(watermelon)
        
        return data

    }
    static var animal: [PPBWord] {
        var data : [PPBWord] = []
        let bat = PPBWord.init(word: "bat", imageFile: "bat.png", category: PPBCategory.animal, note: "")
        data.append(bat)
        
        let bear = PPBWord.init (word: "bear", imageFile: "bear.png", category: PPBCategory.animal, note: "")
        data.append(bear)
        
        let buffalo = PPBWord.init(word: "buffalo", imageFile: "buffalo.png", category: PPBCategory.animal, note: "")
        data.append(buffalo)
        
        let bulldog = PPBWord.init(word: "bulldog", imageFile: "bulldog.png", category: PPBCategory.animal, note: "")
        data.append(bulldog)
        
        let cat = PPBWord.init(word: "cat", imageFile: "cat.png", category: PPBCategory.animal, note: "")
        data.append(cat)
        
        let cheetah = PPBWord.init (word: "cheetah", imageFile: "cheetah.png", category: PPBCategory.animal, note: "")
        data.append(cheetah)
        
        let chicken = PPBWord.init(word: "chicken", imageFile: "chicken.png", category: PPBCategory.animal, note: "")
        data.append(chicken)
        
        let cow = PPBWord.init(word: "cow", imageFile: "cow.png", category: PPBCategory.animal, note: "")
        data.append(cow)
        
        let crab = PPBWord.init(word: "crab", imageFile: "crab.png", category: PPBCategory.animal, note: "")
        data.append(crab)
        
        let crocodile = PPBWord.init(word: "crocodile", imageFile: "crocodile.png", category: PPBCategory.animal, note: "")
        data.append(crocodile)
        
        let crow = PPBWord.init(word: "crow", imageFile: "crow.png", category: PPBCategory.animal, note: "")
        data.append(crow)
        
        let deer = PPBWord.init(word: "deer", imageFile: "deer.png", category: PPBCategory.animal, note: "")
        data.append(deer)
        
        let dog = PPBWord.init(word: "dog", imageFile: "dog.png", category: PPBCategory.animal, note: "")
        data.append(dog)
        
        let dolphin = PPBWord.init(word: "dolphin", imageFile: "dolphin.png", category: PPBCategory.animal, note: "")
        data.append(dolphin)
        
        let duck = PPBWord.init(word: "duck", imageFile: "duck.png", category: PPBCategory.animal, note: "")
        data.append(duck)
        
        let eagle = PPBWord.init(word: "eagle", imageFile: "eagle.png", category: PPBCategory.animal, note: "")
        data.append(eagle)
        
        let elephant = PPBWord.init(word: "elephant", imageFile: "elephant.png", category: PPBCategory.animal, note: "")
        data.append(elephant)
        
        let fish = PPBWord.init(word: "fish", imageFile: "fish.png", category: PPBCategory.animal, note: "")
        data.append(fish)
        
        let fox = PPBWord.init(word: "fox", imageFile: "fox.png", category: PPBCategory.animal, note: "")
        data.append(fox)
        
        let horse = PPBWord.init(word: "horse", imageFile: "horse.png", category: PPBCategory.animal, note: "")
        data.append(horse)
        
        let kangaroo = PPBWord.init(word: "kangaroo", imageFile: "kangaroo.png", category: PPBCategory.animal, note: "")
        data.append(kangaroo)
        
        let lion = PPBWord.init(word: "lion", imageFile: "lion.png", category: PPBCategory.animal, note: "")
        data.append(lion)
        
        let monkey = PPBWord.init(word: "monkey", imageFile: "monkey.png", category: PPBCategory.animal, note: "")
        data.append(monkey)
        
        let penguin = PPBWord.init(word: "penguin", imageFile: "penguin.png", category: PPBCategory.animal, note: "")
        data.append(penguin)
        return data
    }
    static var words : [PPBWord] = []
    
    func chooseRandomWord() -> PPBWord{
        if PPBWordService.doneItems.count == PPBWordService.words.count {
            PPBWordService.doneItems = []
        }
        while true {
            let random = Int(arc4random_uniform(UInt32(PPBWordService.words.count)))
            if  !PPBWordService.doneItems.contains(PPBWordService.words[random]){
                return PPBWordService.words[random]
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
    
    
}

