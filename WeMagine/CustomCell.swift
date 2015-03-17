//
//  CustomCell.swift
//  WeMagine
//
//  Created by Victor Souza on 3/16/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var badVotesNumber: UILabel!
    @IBOutlet weak var goodVotesLabel: UILabel!
    @IBOutlet weak var theIdea: UITextView!
    
    var textTest: String!
       
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
