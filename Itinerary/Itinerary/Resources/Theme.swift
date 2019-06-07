//
//  Theme.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/9/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

class Theme {
    
    static let mainFontName = "FasterOne-Regular"
    static let accent = UIColor(named: "Accent")
    static let backgroundColor = UIColor(named: "Background")
    static let Tint = UIColor(named: "Tint")
    
}

struct Alert {
    
   static func createAlert(title: String?, message: String?, preferredStyle: UIAlertController.Style, actionButton: UIAlertAction) -> UIAlertController {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: preferredStyle)
    alert.addAction(actionButton)
        return alert
    }

}
