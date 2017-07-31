//
//  BaseViewController.swift
//  EnglishSpelling
//
//  Created by phuong on 24/7/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    static var nextWord: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nextButton = UIBarButtonItem.init(image: UIImage.init(named: "next"), style: .done, target: self, action: #selector(BaseViewController.nextPPBWord))
        self.navigationItem.rightBarButtonItem = nextButton;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func nextPPBWord(){
        BaseViewController.nextWord = true
     }

}
