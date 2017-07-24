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
    case kitchenware
    case furniture
    case people
    case animal
    
    var value: String {
        switch self {
        case .fruit:
            return "Fruit"
        case .kitchenware:
            return "Kitchenware"
        case .furniture:
            return "Furniture"
        case .animal:
            return "Animal"
        default:
            return "People"
        }
    }
    var categories:[PPBCategory]{
        return  [PPBCategory.fruit, PPBCategory.furniture, PPBCategory.kitchenware,PPBCategory.animal, PPBCategory.people]
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
    static var furniture: [PPBWord]{
        var data : [PPBWord] = []
        data.append(PPBWord.init(word: "armchair", imageFile: "armchair.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "bed", imageFile: "bed.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "carpet", imageFile: "carpet.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "chair", imageFile: "chair.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "cupboard", imageFile: "cupboard.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "mattress", imageFile: "mattress.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "stool", imageFile: "stool.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "mirror", imageFile: "mirror.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "pillow", imageFile: "pillow.png", category: PPBCategory.furniture, note: ""))
        
        data.append(PPBWord.init(word: "sofa", imageFile: "sofa.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "table", imageFile: "table.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "toilet", imageFile: "toilet.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "window", imageFile: "window.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "bookshelf", imageFile: "bookshelf.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "computer", imageFile: "computer.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "dishwasher", imageFile: "dishwasher.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "laptop", imageFile: "laptop.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "phone", imageFile: "phone.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "printer", imageFile: "printer.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "refrigerator", imageFile: "refrigerator.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "vacuum", imageFile: "vacuum.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "television", imageFile: "television.png", category: PPBCategory.furniture, note: ""))
        data.append(PPBWord.init(word: "vase", imageFile: "vase.png", category: PPBCategory.furniture, note: ""))
        
        
        return data
    }
    static var kitchenware: [PPBWord]{
        var data : [PPBWord] = []
        data.append(PPBWord.init(word: "brush", imageFile: "brush.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "colander", imageFile: "colander.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "funnel", imageFile: "funnel.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "glass", imageFile: "glass.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "grater", imageFile: "grater.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "kettle", imageFile: "kettle.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "knife", imageFile: "knife.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "nutcracker", imageFile: "nutcracker.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "pan", imageFile: "pan.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "pot", imageFile: "pot.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "spoon", imageFile: "spoon.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "plate", imageFile: "plate.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "strainer", imageFile: "strainer.png", category: PPBCategory.kitchenware, note: ""))
        data.append(PPBWord.init(word: "whisk", imageFile: "whisk.png", category: PPBCategory.kitchenware, note: ""))
        return data
    }
    static var people: [PPBWord]{
        var data : [PPBWord] = []
        let baby = PPBWord.init(word: "baby", imageFile: "baby.png", category: PPBCategory.people, note: "")
        data.append(baby)
        
        let builder = PPBWord.init(word: "builder", imageFile: "builder.png", category: PPBCategory.people, note: "")
        data.append(builder)
        let businessman = PPBWord.init(word: "businessman", imageFile: "businessman.png", category: PPBCategory.people, note: "")
        data.append(businessman)
        let dancer = PPBWord.init(word: "dancer", imageFile: "dancer.png", category: PPBCategory.people, note: "")
        data.append(dancer)
        
        let doctor = PPBWord.init(word: "doctor", imageFile: "doctor.png", category: PPBCategory.people, note: "")
        data.append(doctor)
        
        let engineer = PPBWord.init(word: "engineer", imageFile: "engineer.png", category: PPBCategory.people, note: "")
        data.append(engineer)
        
        let firefighter = PPBWord.init(word: "firefighter", imageFile: "firefighter.png", category: PPBCategory.people, note: "")
        data.append(firefighter)
        
        let lady = PPBWord.init(word: "lady", imageFile: "lady.png", category: PPBCategory.people, note: "")
        data.append(lady)
        let man = PPBWord.init(word: "man", imageFile: "man.png", category: PPBCategory.people, note: "")
        data.append(man)
        let musician = PPBWord.init(word: "musician", imageFile: "musician.png", category: PPBCategory.people, note: "")
        data.append(musician)
        let police = PPBWord.init(word: "police", imageFile: "police.png", category: PPBCategory.people, note: "")
        data.append(police)
        let scientist = PPBWord.init(word: "scientist", imageFile: "scientist.png", category: PPBCategory.people, note: "")
        data.append(scientist)
        let soldier = PPBWord.init(word: "soldier", imageFile: "soldier.png", category: PPBCategory.people, note: "")
        data.append(soldier)
        let swimmer = PPBWord.init(word: "swimmer", imageFile: "swimmer.png", category: PPBCategory.people, note: "")
        data.append(swimmer)
        let woman = PPBWord.init(word: "woman", imageFile: "woman.png", category: PPBCategory.people, note: "")
        data.append(woman)
        
        let technician = PPBWord.init(word: "technician", imageFile: "technician.png", category: PPBCategory.people, note: "")
        data.append(technician)

        return data
    }
    static var animal: [PPBWord] {
        var data : [PPBWord] = []
        data.append(PPBWord.init(word: "camel", imageFile: "camel.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "falcon", imageFile: "falcon.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "flamingo", imageFile: "flamingo.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "fly", imageFile: "fly.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "frog", imageFile: "frog.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "goat", imageFile: "goat.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "gorilla", imageFile: "gorilla.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "hippopotamus", imageFile: "hippopotamus.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "jaguar", imageFile: "jaguar.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "kitten", imageFile: "kitten.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "leopard", imageFile: "leopard.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "lynx", imageFile: "lynx.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "macaw", imageFile: "macaw.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "octopus", imageFile: "octopus.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "owl", imageFile: "owl.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "panther", imageFile: "panther.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "parrot", imageFile: "parrot.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "pig", imageFile: "pig.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "pigeon", imageFile: "pigeon.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "rabbit", imageFile: "rabbit.png", category: PPBCategory.animal, note: ""))
        data.append(PPBWord.init(word: "rat", imageFile: "rat.png", category: PPBCategory.animal, note: ""))
        
        data.append(PPBWord.init(word: "spider", imageFile: "spider.png", category: PPBCategory.animal, note: ""))
        
        data.append(PPBWord.init(word: "wolf", imageFile: "wolf.png", category: PPBCategory.animal, note: ""))
        
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

