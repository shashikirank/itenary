//
//  ActivityViewCell.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 6/4/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

class ActivityViewCell: UITableViewCell {

    @IBOutlet weak var cardsView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var activityImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardsView.addShadowAndCornerRadius()
    }

    func setUp(model: ActivityModel) {
        titleLabel.text = model.title
        subTitleLabel.text = model.subtitle
        activityImageView.image = activityImage(type: model.activityType)
        
    }

    func activityImage(type: ActivityType) -> UIImage? {
        
        switch type {
        case .auto:
           return #imageLiteral(resourceName: "auto")
        case .excursion:
             return #imageLiteral(resourceName: "excursion")
        case .flight:
             return #imageLiteral(resourceName: "flight")
        case .food:
             return #imageLiteral(resourceName: "excursion")
        case .hotel:
             return #imageLiteral(resourceName: "hotel")
        }
    }
}
