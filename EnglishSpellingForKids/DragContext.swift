//
//  DragContext.swift
//  test3
//
//  Created by phuong on 22/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit
import Foundation

class DragContext{

    var draggedView : LetterLabel
    var originalPosition : CGPoint
    
    var originalView: UIView
    
    init(withDraggedView draggedView: LetterLabel){
        self.draggedView = draggedView
        originalPosition = draggedView.frame.origin
        originalView = draggedView.superview!
        
    }
    
    func snapToOriginalPosition(forLetters letters: [OriginalLetter],atIndex index: Int) {
        draggedView.removeFromSuperview()
        letters[index].textColor = LetterColor.originalLetterNormal.value
        
    }
}
