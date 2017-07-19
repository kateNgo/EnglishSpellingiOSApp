//
//  TargetView.swift
//  EnglishSpellingForKids
//
//  Created by phuong on 15/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit

class LetterView: UIView {

    var letterConstraints: [NSLayoutConstraint] = []
    init(){
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0 ))
        self.backgroundColor = UIColor.cyan
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func makeConstraint(withLabel label: LetterLabel){
        let xCenterConstraint = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        let yCenterConstraint = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingConstraint1 = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint1 = NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        
        let topConstraint1 = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint1 = NSLayoutConstraint(item: label, attribute: .bottom , relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        letterConstraints = [xCenterConstraint, yCenterConstraint, leadingConstraint1, trailingConstraint1, topConstraint1, bottomConstraint1]
        //letterConstraints = [xCenterConstraint, yCenterConstraint, leadingConstraint1, trailingConstraint1]
        self.addConstraints(letterConstraints)
    }
    func removeConstraints() {
        self.removeConstraints(letterConstraints)
    }
    
}
