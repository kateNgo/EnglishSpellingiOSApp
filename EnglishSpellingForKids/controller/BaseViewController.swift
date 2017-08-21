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
        addNextButton()
        addFavouriteWordsButton()
        addSettingButton()
        
    }
    func addNextButton(){
        let nextButton = UIBarButtonItem.init(image: UIImage.init(named: "next"), style: .done, target: self, action: #selector(BaseViewController.nextPPBWord))
        self.navigationItem.rightBarButtonItem = nextButton;
    }
    func addSettingButton() {
        let settingButton = UIBarButtonItem.init(image: UIImage.init(named: "setting"), style: .done, target: self, action: #selector(BaseViewController.settingFunction))
        
        self.navigationItem.rightBarButtonItems?.append(settingButton)
    }
    func addFavouriteWordsButton() {
        let favouriteWordsButton = UIBarButtonItem.init(image: UIImage.init(named: "favouriteWords"), style: .done, target: self, action: #selector(BaseViewController.favouriteWordsFunction))
        
        self.navigationItem.rightBarButtonItems?.append(favouriteWordsButton)
    }
    func favouriteWordsFunction(){
        print("Favourite words")
    }
    func settingFunction(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsViewController = storyBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(settingsViewController, animated: true)
    }
    func nextPPBWord(){
        BaseViewController.nextWord = true
     }

}
