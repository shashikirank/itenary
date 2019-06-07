//
//  UIView+Extensions.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/8/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit


extension UIView {
    
   public func addShadowAndCornerRadius() {
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = 10
        self.backgroundColor = Theme.accent
    }
}

extension UITableViewCell{
    /// Returns string representation of this class
    class var identifier: String {             // not using static, as class can be overridden
        return String(describing: self)
    }
}

extension UIViewController{
    
    static func getInstance() -> UIViewController {
        let storyBoard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyBoard.instantiateInitialViewController()!
    }
}
