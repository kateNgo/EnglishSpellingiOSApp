//
//  ResultViewController.swift
//  EnglishSpellingForKids
//
//  Created by phuong on 22/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit
import AudioToolbox

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    
    
    @IBOutlet var resultImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                let filename = "welldone"
        let ext = "wav"
        if let soundURL = Bundle.main.url(forResource: filename, withExtension: ext){
            var soundId: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundId)
            
            AudioServicesAddSystemSoundCompletion(soundId, nil, nil, { (soundId, clientData) -> Void in
                AudioServicesDisposeSystemSoundID(soundId)
            }, nil)
            
            AudioServicesPlaySystemSound(soundId)
        }
        let resultImage = UIImage.gifImageWithName("welldone1")
        resultImageView.image = resultImage

    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
