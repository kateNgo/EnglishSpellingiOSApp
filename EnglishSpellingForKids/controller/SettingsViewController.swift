//
//  SettingViewController.swift
//  EnglishSpelling
//
//  Created by phuong on 20/8/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit
import AVFoundation

class SettingsViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{

    @IBOutlet weak var pronouncedLetterLabel: UILabel!
    @IBOutlet weak var pronouncedWordLabel: UILabel!
    @IBOutlet weak var pronunciationWordSwitch: UISwitch!
    
    @IBOutlet weak var pronunciationLetterSwitch: UISwitch!
    
    @IBOutlet weak var volumnLabel: UILabel!
    @IBOutlet weak var volumnSlider: UISlider!
    
    @IBOutlet weak var voicePicker: UIPickerView!
    var arrVoiceLanguages: [Dictionary<String, String?>] = []
     override func viewDidLoad() {
        super.viewDidLoad()
        voicePicker.dataSource = self
        voicePicker.delegate = self
        prepareVoiceList()
        initialValue()
        volumnLabel.text = NSString(format: "Volumn: %.1f", volumnSlider.value) as String
        
    }
    
    @IBAction func yourWordSetting(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wordListViewController = storyBoard.instantiateViewController(withIdentifier: "yourWords") as! WordListViewController
        self.navigationController?.pushViewController(wordListViewController, animated: true)
        
    }
    private func setText(compoment: UILabel, text: String, value: Bool ){
        if value {
            compoment.text = text + "ON"
        }else{
            compoment.text = text + "OFF"
        }
    }
    
    func initialValue(){
        pronunciationWordSwitch.isOn = PPBWordService.pronouncedWord
        pronunciationLetterSwitch.isOn = PPBWordService.pronouncedLetter
        setText(compoment: pronouncedWordLabel, text: PPBWordService.pronouncedWordLabel, value: pronunciationWordSwitch.isOn )
        setText(compoment: pronouncedLetterLabel, text: PPBWordService.pronouncedLetterLabel, value: pronunciationLetterSwitch.isOn )
        
        volumnSlider.value = PPBWordService.volumn
        volumnLabel.text = NSString(format: "Volumn: %.1f", volumnSlider.value) as String
        print(PPBWordService.voiceLanguage)
        voicePicker.selectRow(getPreviousVoiceSetting(), inComponent: 0, animated: true)
    }
    
    @IBAction func switchesChanges(_ sender: UISwitch) {
        if sender.tag == 1 {
            PPBWordService.pronouncedWord = sender.isOn
            setText(compoment: pronouncedWordLabel, text: PPBWordService.pronouncedWordLabel, value: pronunciationWordSwitch.isOn )
            
        }else{
            PPBWordService.pronouncedLetter = sender.isOn
            setText(compoment: pronouncedLetterLabel, text: PPBWordService.pronouncedLetterLabel, value: pronunciationLetterSwitch.isOn )
        }
    }
    
    @IBAction func volumnSliderChange(_ sender: UISlider) {
        volumnLabel.text = NSString(format: "Volumn: %.1f",  sender.value) as String
    }
   
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrVoiceLanguages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let voiceLanguagesDictionary = arrVoiceLanguages[row] as Dictionary<String, String?>
        
        return voiceLanguagesDictionary["languageName"]!
    }
    //MARK: Delegates
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let arr = arrVoiceLanguages[row]["languageCode"]{
            PPBWordService.voiceLanguage =   arr!
        }
    }
    
   
    // methds for voice picker
    func prepareVoiceList() {
        for voice in AVSpeechSynthesisVoice.speechVoices() {
            let voiceLanguageCode = (voice as AVSpeechSynthesisVoice).language
            
            let languageName = (Locale.current as NSLocale).displayName(forKey: NSLocale.Key.identifier, value: voiceLanguageCode)
            
            let dictionary = ["languageName": languageName, "languageCode": voiceLanguageCode]
            
            arrVoiceLanguages.append(dictionary)
        }
    }
    func getPreviousVoiceSetting() -> Int{
        for index in 0..<arrVoiceLanguages.count{
            if let arr = arrVoiceLanguages[index]["languageCode"] , arr == PPBWordService.voiceLanguage
            {
                return index
            }
        }
        return 0
    }
}

