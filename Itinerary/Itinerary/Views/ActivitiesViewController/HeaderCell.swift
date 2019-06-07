//
//  HeaderCell.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 6/3/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }    
    
    func setup(model: DayModel) {
        titleLabel.text = model.title
        subTitleLabel.text = model.subtitle
        titleLabel.font = UIFont.boldSystemFont(ofSize: 21)
        subTitleLabel.font = UIFont(name: Theme.mainFontName, size: 21)
    }

}
