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
        
        centerText()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func centerText()
    {
        var tf: UITextView = self.theIdea as UITextView
        var size: CGSize = tf.sizeThatFits(CGSize(width: self.theIdea.bounds.width, height: 10000))
        var topCorrectFade = (self.theIdea.bounds.height - size.height * self.theIdea.zoomScale)/2
        topCorrectFade = (topCorrectFade < 0.0 ? 0.0 : topCorrectFade)
        self.theIdea.contentOffset.x = 0
        self.theIdea.contentOffset.y = -topCorrectFade
        println(topCorrectFade)
    }
    
}
