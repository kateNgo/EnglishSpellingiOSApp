//
//  PPBenWord.swift
//  EnglishSpelling
//
//  Created by phuong on 23/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox
import AVFoundation

enum PPBCategory: String {
    case fruit
    case kitchenware
    case furniture
    case people
    case clothing
    case animal
    case objects
    
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
        case .clothing:
            return "Clothing"
        case .objects:
            return "Objects"
        default:
            return "People"
        }
    }
    var categories:[PPBCategory]{
        return  [PPBCategory.fruit, PPBCategory.furniture, PPBCategory.kitchenware,PPBCategory.animal, .clothing, .objects ,PPBCategory.people]
    }
}

class PPBWordService {
    
    static var doneItems: [PPBWord] = []
    static var yourWords: [PPBWord] = []
    static var fruit: [PPBWord] {
        var data : [PPBWord] = []
        data.append(PPBWord.init(word: "apricot", imageFile: "apricot.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "grapefruit", imageFile: "grapefruit.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "mango", imageFile: "mango.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "peach", imageFile: "peach.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "persimmon", imageFile: "persimmon.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "pineapple", imageFile: "pineapple.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "raspberry", imageFile: "raspberry.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "papaya", imageFile: "papaya.png", category: PPBCategory.fruit, note: ""))
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
        
        data.append(PPBWord.init(word: "durian", imageFile: "durian.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "guava", imageFile: "guava.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "jackfruit", imageFile: "jackfruit.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "longan", imageFile: "longan.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "mandarin", imageFile: "mandarin.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "nectarine", imageFile: "nectarine.png", category: PPBCategory.fruit, note: ""))
        data.append(PPBWord.init(word: "rockmelon", imageFile: "rockmelon.png", category: PPBCategory.fruit, note: ""))
        
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
        data.append(PPBWord.init(word: "scales", imageFile: "scales.png", category: PPBCategory.kitchenware, note: ""))
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
        data.append(PPBWord.init(word: "postman", imageFile: "postman.png", category: PPBCategory.people, note: ""))
        data.append(PPBWord.init(word: "athlete", imageFile: "athlete.png", category: PPBCategory.people, note: ""))
        data.append(PPBWord.init(word: "guitarist", imageFile: "guitarist.png", category: PPBCategory.people, note: ""))
        data.append(PPBWord.init(word: "model", imageFile: "model.png", category: PPBCategory.people, note: ""))
        data.append(PPBWord.init(word: "nurse", imageFile: "nurse.png", category: PPBCategory.people, note: ""))
        data.append(PPBWord.init(word: "pianist", imageFile: "pianist.png", category: PPBCategory.people, note: ""))
        
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
    static var objects: [PPBWord] {
        var data : [PPBWord] = []
        data.append(PPBWord.init(word: "ball", imageFile: "ball.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "baseball", imageFile: "baseball.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "bicycle", imageFile: "bicycle.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "bus", imageFile: "bus.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "calculator", imageFile: "calculator.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "camera", imageFile: "camera.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "candle", imageFile: "candle.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "car", imageFile: "car.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "card", imageFile: "card.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "clock", imageFile: "clock.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "coffee", imageFile: "coffee.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "coin", imageFile: "coin.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "cup", imageFile: "cup.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "fan", imageFile: "fan.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "flag", imageFile: "flag.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "flower", imageFile: "flower.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "guitar", imageFile: "guitar.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "hammer", imageFile: "hammer.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "headphones", imageFile: "headphones.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "house", imageFile: "house.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "key", imageFile: "key.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "keyboard", imageFile: "keyboard.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "lamp", imageFile: "lamp.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "loupe", imageFile: "loupe.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "luggage", imageFile: "luggage.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "mailbox", imageFile: "mailbox.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "microphone", imageFile: "microphone.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "matche", imageFile: "matche.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "money", imageFile: "money.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "monitor", imageFile: "monitor.png", category: PPBCategory.objects, note: ""))
        
        data.append(PPBWord.init(word: "motorcycle", imageFile: "motorcycle.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "padlock", imageFile: "padlock.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "piano", imageFile: "piano.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "plane", imageFile: "plane.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "plant", imageFile: "plant.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "plier", imageFile: "plier.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "radio", imageFile: "radio.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "ribbon", imageFile: "ribbon.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "ruler", imageFile: "ruler.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "satellite", imageFile: "satellite.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "scissor", imageFile: "scissor.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "screw", imageFile: "screw.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "screwdriver", imageFile: "screwdriver.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "shield", imageFile: "shield.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "ship", imageFile: "ship.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "shovel", imageFile: "shovel.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "smartphone", imageFile: "smartphone.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "spanner", imageFile: "spanner.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "star", imageFile: "star.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "suitcase", imageFile: "suitcase.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "sunglasses", imageFile: "sunglasses.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "sword", imageFile: "sword.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "tablet", imageFile: "tablet.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "tap", imageFile: "tap.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "tool", imageFile: "tool.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "treasure", imageFile: "treasure.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "umbrella", imageFile: "umbrella.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "watch", imageFile: "watch.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "wrench", imageFile: "wrench.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "blanket", imageFile: "blanket.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "blinds", imageFile: "blinds.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "bottle", imageFile: "bottle.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "container", imageFile: "container.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "curtains", imageFile: "curtains.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "cushion", imageFile: "cushion.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "desk", imageFile: "desk.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "iron", imageFile: "iron.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "mat", imageFile: "mat.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "microwave", imageFile: "microwave.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "storage", imageFile: "storage.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "towel", imageFile: "towel.png", category: PPBCategory.objects, note: ""))
        data.append(PPBWord.init(word: "toy", imageFile: "toy.png", category: PPBCategory.objects, note: ""))
        
        return data
        
    }
    static var clothing: [PPBWord] {
        var data : [PPBWord] = []
        data.append(PPBWord.init(word: "briefs", imageFile: "briefs.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "dress", imageFile: "dress.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "handbag", imageFile: "handbag.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "knitwear", imageFile: "knitwear.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "pajamas", imageFile: "pajamas.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "pants", imageFile: "pants.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "sandals", imageFile: "sandals.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "scarf", imageFile: "scarf.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "singlet", imageFile: "singlet.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "skirt", imageFile: "skirt.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "thongs", imageFile: "thongs.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "backpack", imageFile: "backpack.png", category: PPBCategory.clothing, note: ""))
        data.append(PPBWord.init(word: "bag", imageFile: "bag.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "boots", imageFile: "boots.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "cap", imageFile: "cap.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "gloves", imageFile: "gloves.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "hat", imageFile: "hat.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "jacket", imageFile: "jacket.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "jeans", imageFile: "jeans.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "shirt", imageFile: "shirt.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "shoes", imageFile: "shoes.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "socks", imageFile: "socks.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "suit", imageFile: "suit.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "tie", imageFile: "tie.png", category: PPBCategory.clothing, note: ""))
        
         data.append(PPBWord.init(word: "tshirt", imageFile: "tshirt.png", category: PPBCategory.clothing, note: ""))
         data.append(PPBWord.init(word: "wallet", imageFile: "wallet.png", category: PPBCategory.clothing, note: ""))
        
        return data
    }
    static var animal: [PPBWord] {
        var data : [PPBWord] = []
         data.append(PPBWord.init(word: "anaconda", imageFile: "anaconda.png", category: PPBCategory.animal, note: ""))
         data.append(PPBWord.init(word: "seahorse", imageFile: "seahorse.png", category: PPBCategory.animal, note: ""))
         data.append(PPBWord.init(word: "sheep", imageFile: "sheep.png", category: PPBCategory.animal, note: ""))
        
         data.append(PPBWord.init(word: "zebra", imageFile: "zebra.png", category: PPBCategory.animal, note: ""))
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
    
    
    // This is for test
    static var indexYourWords = -1
    private func  chooseWordInYourWords() -> PPBWord{
        if PPBWordService.indexYourWords >= PPBWordService.words.count - 1 {
            PPBWordService.indexYourWords = 0
        }else {
            PPBWordService.indexYourWords = PPBWordService.indexYourWords + 1
        }
        return PPBWordService.words[PPBWordService.indexYourWords]
        
        
    }
    
    func chooseRandomWord() -> PPBWord{
        if PPBWordService.words == PPBWordService.yourWords{
            return chooseWordInYourWords()
        }else{
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
    func speak(letter str: String){
        let speechSynthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: str)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate - 0.1
        speechSynthesizer.speak(utterance)
    }
    func removeYourWord(word : PPBWord){
        if let index = PPBWordService.yourWords.index(of:word) {
            PPBWordService.yourWords.remove(at: index)
        }
        PPBWordService.words = PPBWordService.yourWords
        if PPBWordService.indexYourWords >= PPBWordService.words.count {
                PPBWordService.indexYourWords = 0
        }
    }
}
extension String{
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
}
extension UIUserInterfaceSizeClass: CustomStringConvertible{
    public var description: String {
        switch self {
        case .compact:
            return "Compact"
        case .regular:
            return "Regular"
        default:
            return "??"
        }
        
    }
}

