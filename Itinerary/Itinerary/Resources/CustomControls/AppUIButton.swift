//
//  AppUIButton.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/9/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = self.frame.height / 2
        backgroundColor = Theme.Tint
        setTitleColor(.white, for: .normal)
        
    }

}
