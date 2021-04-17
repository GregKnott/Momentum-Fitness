//
//  ActivityTableVC.swift
//  Momentum Fitness
//
//  Created by  on 4/16/21.
//

import UIKit

class ActivityTableVC: UITableViewController {
    
    var activity: Activity?
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var repsTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "AddActivityToWorkout",
           let activityName = nameTextField.text,
           let activityReps = repsTextField.text,
           let activityWeight = weightTextField.text {
            activity = Activity(name: activityName, reps: activityReps, weight: activityWeight)
        }
        
    }
}
