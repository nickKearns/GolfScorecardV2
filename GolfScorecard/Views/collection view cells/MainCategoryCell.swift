//
//  MainCategoryCell.swift
//  GolfScorecard
//
//  Created by Nicholas Kearns on 6/22/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class MainCategoryCell: UICollectionViewCell {
    
    static let identifier: String = "MainCategoryCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setupLabel(textLabel: String) {
        self.titleLabel.text = textLabel
    }
    
}
