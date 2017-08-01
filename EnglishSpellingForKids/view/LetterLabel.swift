//
//  LetterLabel.swift
//
//
//  Created by phuong on 14/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit

enum LetterColor{
    case originalLetterNormal
    case originalLetterDragged
    case detinationalLetterHaveNotDropped
    case detinationalLetterHaveDropped
    case originalLetterNormalHeightCompact
    
    var value: UIColor {
        switch self {
        case .originalLetterNormal:
            return UIColor(red: 0, green: 0, blue: 102, alpha: 1)
        case .originalLetterDragged:
            return UIColor(red: 0, green: 0, blue: 102, alpha: 0.3)
        case .detinationalLetterHaveNotDropped:
            return UIColor(red: 102, green: 0, blue: 51, alpha: 0.3)
        case .detinationalLetterHaveDropped:
            return UIColor(red: 102, green: 0, blue: 51, alpha: 1)
        case .originalLetterNormalHeightCompact:
            return UIColor.white
        }
    }
}

class LetterLabel: UILabel {
    
    init(withText text:String){
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0))
        self.text = text
        self.textAlignment = .center
        self.textColor = LetterColor.originalLetterNormal.value
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.boldSystemFont(ofSize: 40)
        self.numberOfLines = 0;
        self.adjustsFontSizeToFitWidth = true
        self.isUserInteractionEnabled = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
class OriginalLetter: LetterLabel{
    var index: Int = 0
    func copyLetter() -> OriginalLetter{
        if let str = self.text {
            let theCopy = OriginalLetter.init(withText: str)
            theCopy.index = self.index
            return  theCopy
        }else {
            return  OriginalLetter.init(withText: "")
        }
    }
}
class DestinationalLetter: LetterLabel{
    func copyLetter() -> DestinationalLetter{
        if let str = self.text {
            let theCopy = DestinationalLetter.init(withText: str)
            return  theCopy
        }else {
            return  DestinationalLetter.init(withText: "")
        }
    }
}
