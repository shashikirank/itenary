//
//  TripsViewController.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/8/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var add : String?
    var tripIndexToEdit : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        view.backgroundColor = Theme.backgroundColor
        addButton.floatingButton()
        
        TripFunctions.readTrips { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    // Added segue to Floating button to navigate to next screen
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addTrip" {
            
            let popUp = segue.destination as! AddTripViewController
            
    // **Pass indexpath to AddTripViewController to populate data in popup when edited **
            popUp.tripIndexToEdit = self.tripIndexToEdit
            
    // callBack is used as once trip is added and clicked on save it should inform to reload tableview to display added trip
            popUp.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
            self.tripIndexToEdit = nil
        }
    }
}


extension TripsViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed:
            @escaping (Bool) -> ()) in
            
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure to delete?", preferredStyle: .alert)
            
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (alertAction) in
                
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        delete.image = #imageLiteral(resourceName: "delete")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (context, view, actionPerformed: @escaping(Bool) -> ()) in
            
            self.tripIndexToEdit = indexPath.row  // **Assign indexpath of edited cell and pass data to AddTripViewController**
            self.performSegue(withIdentifier: "addTrip", sender: nil)
            actionPerformed(true)
        }
//        edit.image = #imageLiteral(resourceName: "Edit")
        edit.backgroundColor = UIColor(named: "Edit")
        return UISwipeActionsConfiguration(actions:[edit])
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let tripSelected = Data.tripModels[indexPath.row]
        
//        let storyBoardInstance = UIStoryboard(name: "ActivitiesVC", bundle: nil)
//        let aVC = storyBoardInstance.instantiateInitialViewController() as! ActivitiesVC
        let aVC = ActivitiesVC.getInstance() as! ActivitiesVC
        aVC.selectedTripId = tripSelected.id
        aVC.titleString = tripSelected.title
        navigationController?.pushViewController(aVC, animated: true)

    }


    
    
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if (editingStyle == .delete) {
    //            TripFunctions.deleteTrip(index: indexPath.row)
    //            tableView.deleteRows(at: [indexPath], with: .automatic)
    //        }
    //    }
}
