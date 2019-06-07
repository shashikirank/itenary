//
//  TripFunctions.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/8/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

typealias CompletionHandler = () -> ()

class TripFunctions {
    
    static func createTrip(tripModel: TripModel){
        Data.tripModels.append(tripModel)
        
    }
    
    static func readTrips(completion: @escaping CompletionHandler ) {
        
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
              Data.tripModels = MockData.createMockTripModelData()
            }
            
            DispatchQueue.main.async {
                completion()
            }
            
        }
    }
    
    
    static func readTrip(by id: UUID, completion : @escaping (TripModel?)->()) {
        
         DispatchQueue.global(qos: .userInteractive).async {
         
            let trip = Data.tripModels.first(where: { $0.id == id})
            
            DispatchQueue.main.async {
                completion(trip)
            }
        }
    }
    
    
    
    static func updateTrips(at index: Int, title : String, image : UIImage?) {
        
        //        if index > 0 {
        //            Data.tripModels.remove(at: index)
        //            Data.tripModels.insert(TripModel(title: title, image: image), at: index)
        //        }else {
        //            Data.tripModels.append(TripModel(title: title, image: image))
        //        }
        
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
        
    }
    
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
        
    }
    
    
}
