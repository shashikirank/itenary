//
//  ActivitiesVC.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/29/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

class ActivitiesVC: UIViewController {

    var selectedTripId : UUID!
    var tripModel: TripModel?
    var headerViewHeight : CGFloat?
    var titleString: String?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: AppUIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = titleString
        addButton.floatingButton()
        tableView.delegate = self
        tableView.dataSource = self
//      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") not needed
        headerViewHeight = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier)?.bounds.height
        readTrips()
    }
    
    fileprivate func readTrips() {
        
        TripFunctions.readTrip(by: selectedTripId) { [weak self] (modelTripSelected) in
            guard let self = self else { return }
            self.tripModel = modelTripSelected
            guard let model = modelTripSelected else { return }
            
            self.imageView.image = model.image
            self.tableView.reloadData()
        }
    }

    
    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func addAction(_ sender: AppUIButton) {
        
        let dayAction = UIAlertAction(title: "Add new Day", style: .default, handler: handleAlertAction)
        let activityAction = UIAlertAction(title: "Add new Activity", style: .default, handler: handleAlertAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let alert = Alert.createAlert(title: nil, message: nil, preferredStyle: .actionSheet, actionButton: dayAction)
        alert.addAction(activityAction)
        alert.addAction(cancelAction)
        alert.view.tintColor = Theme.Tint
        
        alert.popoverPresentationController?.sourceView = sender
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: -4, width: self.view.bounds.width, height: self.view.bounds.height)
        
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    fileprivate func handleAlertAction(action: UIAlertAction){
      
        let aDC = AddDayVC.getInstance()
        self.present(aDC, animated: true, completion: nil)
    }
    
}



extension ActivitiesVC : UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return tripModel?.dayModels[section].title ?? ""
//    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier) as! HeaderCell
        cell.setup(model: (tripModel?.dayModels[section])!)
        return cell.contentView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return headerViewHeight ?? 44
    }
    
    
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: ActivityViewCell.identifier) as! ActivityViewCell
    cell.setUp(model: model!)
    return cell
    }
}
