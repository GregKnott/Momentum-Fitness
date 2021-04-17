//
//  NewWorkoutVC.swift
//  Momentum Fitness
//
//  Created by  on 4/2/21.
//

import UIKit

class NewWorkoutVC: UIViewController {
    
    var workout: Workout?
    
    var workoutDataSource = NewWorkoutDataSource()
    var tableView: UITableView = NewWorkoutTableView()
    @IBOutlet weak var workoutNameTextField: UITextField!
    
    @IBAction func cancelToNewWorkoutVC(_ segue: UIStoryboardSegue){
        
    }
    
    @IBAction func addActivity(_ segue: UIStoryboardSegue) {
        let activityTableVC = segue.source as? ActivityTableVC
        let activity = activityTableVC!.activity
        
        workoutDataSource.append(newActivity: activity!, to: tableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWorkoutToRoutine",
           let workoutName = workoutNameTextField.text{
           let workout = Workout(name: workoutName)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
