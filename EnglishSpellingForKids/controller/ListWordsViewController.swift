//
//  ListWordsViewController.swift
//  EnglishSpelling
//
//  Created by phuong on 21/8/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit

class ListWordsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return PPBCategory.categories.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return PPBWordService.getWords(category: PPBCategory.categories[section]).count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "WordCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WordViewCell  else {
            fatalError("The dequeued cell is not an instance of WordViewCell.")
        }
        let word  = PPBWordService.getWords(category: PPBCategory.categories[indexPath.section])[indexPath.row]
        cell.wordImage.image = UIImage(named:word.imageFile)!
        cell.wordLabel.text = word.word
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return PPBCategory.categories[section].value
    }
    

}
