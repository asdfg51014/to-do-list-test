//
//  TableViewCell.swift
//  seguePractice
//
//  Created by Albert on 2018/8/15.
//  Copyright © 2018 Albert.C. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .white
            titleLabel.font = UIFont(name: "Headline", size: 60)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
