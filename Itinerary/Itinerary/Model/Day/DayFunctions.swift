//
//  DayFunctions.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 6/5/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

class DayFunctions{
    
    static func createDays(at index: Int, with dayModel: DayModel) {
        
        Data.tripModels[index].dayModels.append(dayModel)
        
    }
}
