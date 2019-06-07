//
//  AddDayVC.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 6/5/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

class AddDayVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var subTitleTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving : (() -> ())?
    
    var tripIndex : Int?
    
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 45)
        tripTextField.frame.size = CGSize(width: 350 , height: 40)
       
        if let index = tripIndex{
            let data = Data.tripModels[index]
            tripTextField.text = data.title
            titleLabel.text = "Add Trip"
        }
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // Add day to perticular trip
    @IBAction func save(_ sender: Any) {
       
        guard tripTextField.hasValue, let tripAdded = tripTextField.text else { return }
        
        let dayModel = DayModel(title: tripAdded, subtitle: subTitleTextField.text! , data: nil)
        DayFunctions.createDays(at:tripIndex ?? 0, with:dayModel)
        
        if let callBack = doneSaving {
            callBack()
        }
        dismiss(animated: true, completion: nil)
    }
 }

