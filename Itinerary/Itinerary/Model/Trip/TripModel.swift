//
//  TripModel.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/8/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

struct TripModel {
    let id : UUID
    var title : String
    var image : UIImage?
    var dayModels = [DayModel]()
    
    init(title : String, image : UIImage? = nil, dayModels : [DayModel]? = nil){
        id = UUID()
        self.title = title
        self.image = image
      
        if let dayModel = dayModels{
            self.dayModels = dayModel
        }
    }
}
