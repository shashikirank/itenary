//
//  ActivityModel.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/30/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

enum ActivityType {
    case auto
    case excursion
    case flight
    case food
    case hotel
}


struct ActivityModel {
    
    var id : String!
    var title = ""
    var subtitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    init(title:String, subTitle:String, activityType: ActivityType, photo :UIImage? = nil ){
        
        id = UUID().uuidString
        self.title = title
        self.subtitle = subTitle
        self.activityType = activityType
        self.photo = photo
       }
}
