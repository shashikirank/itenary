//
//  TripsTableViewCell.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/8/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardsView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardsView.addShadowAndCornerRadius()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
        tripsImageView.layer.cornerRadius = 10
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
        tripsImageView.image = tripModel.image
        
        if let tripImage = tripModel.image {
            tripsImageView.alpha = 0.3
            tripsImageView.image = tripImage
            
            UIView.animate(withDuration: 1) {
                self.tripsImageView.alpha = 1.0
            }
        }
    }
}
