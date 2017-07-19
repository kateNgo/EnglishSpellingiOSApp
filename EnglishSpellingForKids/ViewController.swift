//
//  ViewController.swift
//  EnglishSpellingForKids
//
//  Created by phuong on 15/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var originArea: UIView!
    @IBOutlet var destinationArea: UIView!
    
    
    let paddingLetter: Double = 3.0
    let margin: Double = 3.0
    let textColor = UIColor.black
    var currentWord: PPBWord?
    var originalletters: [OriginalLetter] = []
    var destinationalLetters : [DestinationalLetter] = []
    var destinationViews: [LetterView] = []
    var originalViews: [LetterView] = []
    var originalStackView: UIStackView?
    var destinationalStackView : UIStackView?
    
    var dragContext: DragContext?
    var dragLetters: [UILabel] = []
    var dropAreas: [UIView] = []
    var draggedLetter : LetterView?
    var fruit: [PPBWord] = []
    var animal: [PPBWord] = []
    var words : [PPBWord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = PPBWordService()
        fruit = service.initFruitData()
        animal = service.initAnimalData()
        service.saveWords(withWord: fruit)
        service.saveWords(withWord: animal)
        words = animal
        chooseWord()
        
        
    }
    
    @IBAction func doneButtonPress(_ sender: UIButton) {
        for letter in destinationalLetters{
            if letter.text == "" {
                // display alert message
                return
            }
        }
        self.performSegue(withIdentifier: "showResultScreen", sender: self)
    }
    func chooseWord(){
        
        let random = getRandom(words.count)
        currentWord = words[random]
        if let word = currentWord {
            self.imageView.image = UIImage(named:word.imageFile!)!
        }
        createOriginViews()
        createDestinationViews()
        setupGestures()
    }
    
    func createOriginViews() {
        if let word = currentWord {
            let numberOfLetter = word.word!.characters.count
            for i in 0..<numberOfLetter{
                let label = OriginalLetter.init(withText: word.word![i])
                label.index = i
                originalletters.append(label)
            }
        }
        originalStackView = makeStackView(listOfLabel: originalletters, in: originArea)
        if let stack = originalStackView {
            setupConstraints(stackView: stack, superView: originArea)
        }
        originArea.layoutIfNeeded()
        originArea.updateConstraints()
        
    }
    func createDestinationViews() {
        if let word = currentWord {
            let numberOfLetter = word.word!.characters.count
            for _ in 0..<numberOfLetter{
                let label = DestinationalLetter.init(withText: "")
                label.backgroundColor = UIColor.brown
                destinationalLetters.append(label)
            }
        }
        destinationalStackView = makeStackView(listOfLabel: destinationalLetters, in: destinationArea)
        if let stack = destinationalStackView {
            setupConstraints(stackView: stack, superView:destinationArea)
        }
        destinationArea.layoutIfNeeded()
        destinationArea.updateConstraints()
    }
   
    
    func setupGestures() {
        let pan = UIPanGestureRecognizer(target:self, action:#selector(ViewController.pan(_:)))
        pan.maximumNumberOfTouches = 1
        pan.minimumNumberOfTouches = 1
        self.view.addGestureRecognizer(pan)
    }
    
    
    func pan(_ rec:UIPanGestureRecognizer) {
        switch rec.state {
        case .began:
            for letter in originalletters {
                if  checkDraggableForOriginalLetters(forLetter: letter, withRecognizer: rec){
                    let draggingLetter = letter.copyLetter()
                    rec.view?.addSubview(draggingLetter)
                    dragContext = DragContext.init(withDraggedView: draggingLetter)
                    letter.textColor = LetterColor.originalLetterDragged.value
                    dragObjectAccordingToGesture(recorgnizer: rec)
                    break
                }
            }
            for letter in destinationalLetters {
                if  checkDraggableForDestinationalLetters(forLetter: letter, withRecognizer: rec){
                    // copy a letter for dragging
                    let draggingLetter = letter.copyLetter()
                    rec.view?.addSubview(draggingLetter)
                    dragContext = DragContext.init(withDraggedView: draggingLetter)
                    letter.text = ""
                    dragObjectAccordingToGesture(recorgnizer: rec)
                }
            }
        case .changed:
            dragObjectAccordingToGesture(recorgnizer: rec)
        case .ended:
            if let context = dragContext {
                let viewBeingDraggedView = context.draggedView
                if viewBeingDraggedView is OriginalLetter {
                    let droppedViewInKnownArea = self.droppableLetterToDestination(ForDraggedView: viewBeingDraggedView, withRecognizer: rec)
                    if !droppedViewInKnownArea {
                        if let originalLetter = context.draggedView as? OriginalLetter {
                            context.snapToOriginalPosition(forLetters: originalletters, atIndex: originalLetter.index)
                        }
                    }
                }else {
                   returnOriginalLetter(ForDraggedView: viewBeingDraggedView, withRecognizer: rec)
                }
                dragContext = nil
            }
            
        default:
            dragContext = nil
        }
    }
    private func droppableLetterToDestination(ForDraggedView viewBeingDraggedView: LetterLabel,withRecognizer  rec: UIPanGestureRecognizer) -> Bool{
        var droppedViewInKnownArea = false
        for destinationalLetter in destinationalLetters {
            let pointInDropView = rec.location(in: destinationalLetter)
            if destinationalLetter.point(inside: pointInDropView, with: nil){
                droppedViewInKnownArea = true
                viewBeingDraggedView.removeFromSuperview()
                destinationalLetter.text = viewBeingDraggedView.text
            }
        }
        return droppedViewInKnownArea
    }
    private func returnOriginalLetter(ForDraggedView viewBeingDraggedView: LetterLabel,withRecognizer  rec: UIPanGestureRecognizer){
        for letter in originalletters {
            if letter.text == viewBeingDraggedView.text && letter.textColor == LetterColor.originalLetterDragged.value {
                viewBeingDraggedView.removeFromSuperview()
                letter.textColor = LetterColor.originalLetterNormal.value
                return
            }
        }
    }
    
    private func dragObjectAccordingToGesture( recorgnizer: UIPanGestureRecognizer){
        if let context = dragContext {
            let pointOnView = recorgnizer.location(in: recorgnizer.view)
            context.draggedView.center = pointOnView
            
        }
    }
    
    private func setupConstraints(stackView: UIStackView, superView: UIView) {
        let centerX = NSLayoutConstraint(item: stackView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: stackView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: stackView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: stackView, attribute: .width, relatedBy: .equal, toItem: superView, attribute: .width, multiplier: 1, constant: 0)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        superView.addConstraints([centerX, centerY, height, width])
    }

    private func makeStackView(listOfLabel labels: [LetterLabel], in area: UIView ) -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: labels)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = CGFloat(paddingLetter)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.frame = area.frame
        stackView.center = CGPoint.init(x: area.frame.width/2, y: area.frame.height/2)
        area.addSubview(stackView)
        return stackView
        
    }
    private func checkDraggableForOriginalLetters(forLetter letter: OriginalLetter, withRecognizer rec: UIPanGestureRecognizer) -> Bool{
        if letter.textColor == LetterColor.originalLetterDragged.value {
            return false
        }
        let pointInLettersView = rec.location(in: letter)
        return letter.point(inside: pointInLettersView, with: nil)
        
    }
    private func checkDraggableForDestinationalLetters(forLetter letter: DestinationalLetter, withRecognizer rec: UIPanGestureRecognizer) -> Bool{
        if letter.text == "" {
            return false
        }
        let pointInLettersView = rec.location(in: letter)
        return letter.point(inside: pointInLettersView, with: nil)
        
    }
    func getRandom(_ max: Int) -> Int{
        return  Int(arc4random_uniform(UInt32(max)))
        
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
