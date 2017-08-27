//
//  WordListViewController.swift
//  EnglishSpelling
//
//  Created by phuong on 21/8/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit

class WordListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var sections: [Section] = []
    let imageCheckings: [UIImage] = [UIImage.init(named: "unchecked")!, UIImage.init(named: "checked")!]
    
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelection = true
        prepareSections()
    }
    func createIndicator(){
        indicator.center = view.center
        indicator.hidesWhenStopped = true
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expandable = !sections[section].expandable
        tableView.beginUpdates()
        for i in 0..<sections[section].words.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].category, section: section, delegate: self )
        return header
    }
    func prepareSections(){
        for category in PPBCategory.categories{
            let section = Section.init(category: category.value, words: PPBWordService.getWords(category: category), expandable: false)
            sections.append(section)
        }
        sections[0].expandable = true
        indicator.stopAnimating()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section].expandable{
            return 44
        }else{
            return 0
        }
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].words.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "wordCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WordViewCell  else {
            fatalError("The dequeued cell is not an instance of WordListTableViewCell.")
        }
        let word = sections[indexPath.section].words[indexPath.row]
        cell.wordImage.image = UIImage.init(named: word.imageFile)
        cell.wordLabel.text = word.word
        if PPBWordService.yourWords.contains(word) {
            cell.checkButton.imageView?.image = imageCheckings[1]
        }else{
            cell.checkButton.imageView?.image = imageCheckings[0]
        }
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? WordViewCell else
        {
            return
        }
        cell.contentView.backgroundColor = UIColor.white
        cell.checkButton.imageView?.image = imageCheckings[1]
        let word = sections[indexPath.section].words[indexPath.row]
        toggleChecked(cell: cell, forWord: word)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? WordViewCell else
        {
            return
        }
        let word = sections[indexPath.section].words[indexPath.row]
        toggleChecked(cell: cell, forWord: word)
    }
    private func toggleChecked(cell: WordViewCell, forWord word: PPBWord){
        if PPBWordService.yourWords.contains(word) {
            cell.checkButton.imageView?.image = imageCheckings[0]
            if let index = PPBWordService.yourWords.index(of:word) {
                PPBWordService.yourWords.remove(at: index)
            }
        }else{
            cell.checkButton.imageView?.image = imageCheckings[1]
            PPBWordService.yourWords.append(word)
        }
           }
}
