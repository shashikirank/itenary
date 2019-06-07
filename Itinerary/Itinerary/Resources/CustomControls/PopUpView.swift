//
//  PopUpView.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/9/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

class PopUpView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = 10
        self.backgroundColor = Theme.backgroundColor
    }

}
