//
//  WordViewCell.swift
//  EnglishSpelling
//
//  Created by phuong on 21/8/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit

class WordViewCell: UITableViewCell {

    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var wordImage: UIImageView!
    
    @IBOutlet weak var wordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
