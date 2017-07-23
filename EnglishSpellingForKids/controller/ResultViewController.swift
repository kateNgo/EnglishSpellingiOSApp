//
//  ResultViewController.swift
//  EnglishSpellingForKids
//
//  Created by phuong on 22/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit


class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultImageView: UIImageView!
    var result = ""
    let numberOfFileResult = 5
    let service = PPBWordService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.setHidesBackButton(true, animated:true);
        let filename = result
        let random = "0"// String( Int(arc4random_uniform(UInt32(numberOfFileResult))))
        let resultImage = UIImage.gifImageWithName(filename  + random)
        resultImageView.image = resultImage
        let rightButton = UIBarButtonItem.init(title: "Next", style: .done, target: self, action: #selector(ResultViewController.nextWord))
        self.navigationItem.rightBarButtonItem = rightButton;
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.service.playSound(filename: result, repeat: false)
    }
    func nextWord(){
        ViewController.nextWord = true
        self.navigationController?.popViewController(animated:true)
        
        
    }
}
