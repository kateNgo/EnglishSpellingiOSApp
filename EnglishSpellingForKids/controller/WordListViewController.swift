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
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSections()
        // Do any additional setup after loading the view.
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
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        let word = sections[indexPath.section].words[indexPath.row]
        cell.wordImage.image = UIImage.init(named: word.imageFile)
        cell.wordLabel.text = word.word
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
}
