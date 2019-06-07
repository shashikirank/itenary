//
//  UIButton+Extension.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/9/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

extension UIButton {
    
    public func floatingButton() {
        layer.cornerRadius = self.frame.height / 2
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        layer.backgroundColor = Theme.Tint?.cgColor
    }
}

extension UITextField {
    
    var hasValue: Bool {
        
        guard text == "" else { return true }
       
        // if text isempty executes below
        let iV = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        iV.image = UIImage(named: "error")
        iV.contentMode = .scaleAspectFill
        self.rightViewMode = .unlessEditing
        self.rightView = iV
        return false
    }
    
}
