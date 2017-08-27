//
//  ExpandableHeaderView.swift
//  EnglishSpelling
//
//  Created by phuong on 21/8/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit

protocol ExpandableHeaderViewDelegate{
    func toggleSection(header: ExpandableHeaderView, section: Int)
}
class ExpandableHeaderView: UITableViewHeaderFooterView {
    var delegate: ExpandableHeaderViewDelegate?
    var section: Int!
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
    func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer){
        let cell = gestureRecognizer.view as! ExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    func customInit(title: String, section: Int, delegate:ExpandableHeaderViewDelegate){
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.white
        self.contentView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 128, alpha: 1)
    }
}
