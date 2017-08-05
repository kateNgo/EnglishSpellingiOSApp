//
//  ViewController.swift
//  EnglishSpelling
//
//  Created by phuong on 15/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: BaseViewController {

    @IBOutlet var doneButton: UIButton!
    
    @IBOutlet var leadingContraint: NSLayoutConstraint!
    
    @IBOutlet var menuView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var originArea: UIView!
    @IBOutlet var destinationArea: UIView!
    @IBOutlet weak var stackButtons: UIStackView!
    @IBOutlet var starButton: UIButton!
    @IBOutlet var speakerButton: UIButton!
    
    @IBOutlet weak var yourWordsButton: UIButton!
    var dragContext: DragContext?
    var menuShown = true
    let paddingLetter: Double = 3.0
    var currentWord: PPBWord = PPBWord()
    var word: String = ""
    var originalletters: [OriginalLetter] = []
    var destinationalLetters : [DestinationalLetter] = []
    var originalStackView: UIStackView?
    var destinationalStackView : UIStackView?
    var result = ""
    let service = PPBWordService()
    var answerMode = false
    var answerButton: UIBarButtonItem = UIBarButtonItem.init()
    var  undoButton = UIBarButtonItem()
    var pan = UIPanGestureRecognizer()
    let starOnImage = UIImage.init(named: "star_on")
    let starOffImage = UIImage.init(named: "star_off")
    
    
    var colorOriginalLetter: UIColor {
        if traitCollection.verticalSizeClass == .regular{
            return LetterColor.originalLetterNormal.value
        }else{
            return  LetterColor.originalLetterNormalHeightCompact.value
        }
    }
    var colorOriginalLetterDragged: UIColor{
        if traitCollection.verticalSizeClass == .regular{
            return LetterColor.originalLetterDragged .value
        }else{
            return  LetterColor.originalLetterDraggedHeightCompact.value
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
        setupGestures()
        self.view.addGestureRecognizer(pan)
        self.addUndoButton()
        self.addAnswerButton(name: "question")
        chooseWord()
        addTapGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if BaseViewController.nextWord {
            chooseWord()
            ViewController.nextWord = false
        }
        processYourWordsButton()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: {  coordinator in
            for letter in self.originalletters {
                if letter.dragged {
                    letter.textColor = self.colorOriginalLetterDragged
                }else {
                    letter.textColor = self.colorOriginalLetter
                }
            }
        }, completion: nil)
    }
    
    @IBAction func starButtonPressed(_ sender: Any) {
        if starButton.image(for: .normal) == starOffImage{
            PPBWordService.yourWords.append(currentWord)
            starButton.setImage(starOnImage, for:.normal)
        }else{
            service.removeYourWord(word: currentWord)
            starButton.setImage(starOffImage, for:.normal)
        }
        processYourWordsButton()
    }
    private func processYourWordsButton(){
        if PPBWordService.yourWords.count == 0 {
            //yourWordsButton.isEnabled = false
            yourWordsButton.setEnabled(enabled: false)
            PPBWordService.words = PPBWordService.animal
        }else{
            //yourWordsButton.isEnabled = true
            yourWordsButton.setEnabled(enabled: true)
        }
    }
    @IBAction func speakButtonPressed(_ sender: UIButton) {
        currentWord.speak()
    }
    
    @IBAction func menuShowing(_ sender: UIBarButtonItem) {
        if menuShown {
            leadingContraint.constant = -20
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }else {
            leadingContraint.constant = -160
            
        }
        menuShown = !menuShown
    }
    
    @IBAction func menuItemSelecting(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "Fruit":
            PPBWordService.words = PPBWordService.fruit
        case "People":
            PPBWordService.words = PPBWordService.people
        case "Kitchenware":
            PPBWordService.words = PPBWordService.kitchenware
        case "Furniture":
            PPBWordService.words = PPBWordService.furniture
        case "Objects":
            PPBWordService.words = PPBWordService.objects
        case "Clothing":
            PPBWordService.words = PPBWordService.clothing
        case "Your Words":
            PPBWordService.words = PPBWordService.yourWords
        default:
            PPBWordService.words = PPBWordService.animal
        }
        leadingContraint.constant = -160
        menuShown = true
        PPBWordService.doneItems = []
        chooseWord()
    }
    
    func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.speakButtonPressed(_:)))
        tapGesture.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(tapGesture)
    }
    
    func addGesture(){
        if let gess = self.view.gestureRecognizers, gess.count == 0 {
            self.view.addGestureRecognizer(pan)
        }
        self.doneButton.isEnabled = true
    }
    func removeGesture(){
        if let gess = self.view.gestureRecognizers, gess.count > 0 {
            self.view.removeGestureRecognizer(gess[0])
        }
        self.doneButton.isEnabled = false
    }
    func setupGestures() {
        pan = UIPanGestureRecognizer(target:self, action:#selector(ViewController.pan(_:)))
        pan.maximumNumberOfTouches = 1
        pan.minimumNumberOfTouches = 1
    }
    
    private func addAnswerButton(name: String) {
        if let items = self.navigationItem.rightBarButtonItems, items.count == 3{
            self.navigationItem.rightBarButtonItems?.remove(at: 2)
        }
        answerButton = UIBarButtonItem.init(image: UIImage.init(named: name), style: .done, target: self, action: #selector(ViewController.answerBarItemClick))
        self.navigationItem.rightBarButtonItems?.append(answerButton)
        
    }
    private func addUndoButton() {
        undoButton = UIBarButtonItem.init(image: UIImage.init(named: "undo"), style: .done, target: self, action: #selector(ViewController.undoBarItemClick))
        self.navigationItem.rightBarButtonItems?.append(undoButton)
    }
    func undoBarItemClick(){
        let numberOfLetter = word.characters.count
        for i in 0..<numberOfLetter{
            originalletters[i].text = word[i]
            originalletters[i].dragged = false
            originalletters[i].textColor = self.colorOriginalLetter
            destinationalLetters[i].text = ""
        }
        
    }
    func answerBarItemClick(){
        if !answerMode {
            clearConstraint()
            createOriginViews()
            createDestinationViews()
            answerMode = true
            self.addAnswerButton(name: "question")
            undoButton.isEnabled = true
            addGesture()
        }else{
            answerPPBWord()
            answerMode = false
            undoButton.isEnabled = false
            self.addAnswerButton(name: "answer")
            for letter in originalletters {
                letter.dragged = true
            }
            removeGesture()
        }
    }
    func answerPPBWord(){
        let numberOfLetter = currentWord.word.characters.count
        for i in 0..<numberOfLetter{
            destinationalLetters[i].text = currentWord.word[i]
            originalletters[i].textColor = self.colorOriginalLetterDragged
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        result = ""
        for letter in destinationalLetters{
            guard let ch = letter.text, ch != "" else {
                return false
            }
            result = result.appending( ch)
        }
        if result == currentWord.word{
            result = "welldone"
            PPBWordService.doneItems.append(currentWord)
        }else {
            result = "tryagain"
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ResultViewController {
            controller.result = result
        }
    }
    
    func chooseWord(){
        currentWord = service.chooseRandomWord()
        word = String (currentWord.word.characters.sorted())
        self.imageView.image = UIImage(named:currentWord.imageFile)!
        clearConstraint()
        createOriginViews()
        createDestinationViews()
        answerMode = false
        answerBarItemClick()
        currentWord.speak()
        if PPBWordService.yourWords.contains(currentWord){
            starButton.setImage(starOnImage, for: .normal)
        }else{
            starButton.setImage(starOffImage, for: .normal)
        }
        
    }
    
    func clearConstraint(){
        var constraints = originArea.constraints
        originArea.removeConstraints(constraints)
        var subViews = originArea.subviews
        for sub in subViews{
            sub.removeFromSuperview()
        }
        originalletters = []
        constraints = destinationArea .constraints
        destinationArea.removeConstraints(constraints)
        subViews = destinationArea.subviews
        for sub in subViews{
            sub.removeFromSuperview()
        }
        destinationalLetters = []
    }
    
    func createOriginViews() {
        let numberOfLetter = word.characters.count
        for i in 0..<numberOfLetter{
            let label = OriginalLetter.init(withText: word[i])
            label.index = i
            label.dragged = false
            label.textColor = self.colorOriginalLetter
            originalletters.append(label)
        }
        originalStackView = makeStackView(listOfLabel: originalletters, in: originArea)
        if let stack = originalStackView {
            setupConstraints(stackView: stack, superView: originArea)
        }
        originArea.layoutIfNeeded()
        originArea.updateConstraints()
    }
    
    func createDestinationViews() {
        
        let numberOfLetter = word.characters.count
        for _ in 0..<numberOfLetter{
            let label = DestinationalLetter.init(withText: "")
            label.backgroundColor = UIColor.init(red: 30, green: 47, blue: 92, alpha: 1.0)
            label.textColor = LetterColor.originalLetterNormal.value
            destinationalLetters.append(label)
        }
        destinationalStackView = makeStackView(listOfLabel: destinationalLetters, in: destinationArea)
        if let stack = destinationalStackView {
            setupConstraints(stackView: stack, superView:destinationArea)
        }
        destinationArea.layoutIfNeeded()
        destinationArea.updateConstraints()
    }
    
    func pan(_ rec:UIPanGestureRecognizer) {
        switch rec.state {
        case .began:
            for letter in originalletters {
                if  checkDraggableForOriginalLetters(forLetter: letter, withRecognizer: rec){
                    let draggingLetter = letter.copyLetter()
                    service.speak(letter: letter.text!)
                    rec.view?.addSubview(draggingLetter)
                    dragContext = DragContext.init(withDraggedView: draggingLetter)
                    letter.textColor = self.colorOriginalLetterDragged
                    letter.dragged = true
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
                if destinationalLetter.text == "" {
                    droppedViewInKnownArea = true
                    viewBeingDraggedView.removeFromSuperview()
                    destinationalLetter.text = viewBeingDraggedView.text
                    service.playSound(filename: "drop", repeat: true)
                }
            }
        }
        return droppedViewInKnownArea
    }
    
    private func returnOriginalLetter(ForDraggedView viewBeingDraggedView: LetterLabel,withRecognizer  rec: UIPanGestureRecognizer){
        for letter in originalletters {
            if letter.text == viewBeingDraggedView.text && letter.textColor == self.colorOriginalLetterDragged {
                viewBeingDraggedView.removeFromSuperview()
                letter.textColor = self.colorOriginalLetter
                letter.dragged = false
                service.playSound(filename: "dropBack", repeat: true)
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
        if letter.textColor == self.colorOriginalLetterDragged {
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
    override func nextPPBWord() {
        chooseWord()
    }
   
    
   
}

