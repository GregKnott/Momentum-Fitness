//
//  NewWorkoutVC.swift
//  Momentum Fitness
//
//  Created by  on 4/2/21.
//

import UIKit
import CoreData

class NewWorkoutVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Create a new workout data source object
    var workoutDataSource = NewWorkoutDataSource()
    //Create a blank Workout object
    var workoutObject: WorkoutObject?
    //Connect to the tableView in storyboard
    @IBOutlet weak var tableView: NewWorkoutTableView!
    //Create a blank array to be filled from core storage
    var activities: [ActivityObject] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutDataSource.numberOfActivity()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityTableViewCell
        
        cell.activity = workoutDataSource.activity(at: indexPath)
        return cell
    }
    
    //An outlet to connect to the text field for Workout name
    @IBOutlet weak var workoutNameTextField: UITextField!
    
    @IBAction func cancelToNewWorkoutVC(_ segue: UIStoryboardSegue){
        
    }
    
    //A segue method to handle adding an activity
    @IBAction func addActivity(_ segue: UIStoryboardSegue) {
        let activityTableVC = segue.source as? ActivityTableVC
        let activity = activityTableVC!.activity
        workoutDataSource.append(newActivity: activity!, to: tableView)
        activities.append(activity!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Check if segue identifier is AddWorkoutToRoutine and retrieve workout name
        if segue.identifier == "AddWorkoutToRoutine",
           let workoutName = workoutNameTextField.text{
            //Set the workout object as a new workout objec with user inputted details
            workoutObject = WorkoutObject(name: workoutName, activities: activities)
            //Create a reference to AppDelegate
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return
            }
            //Get the container from app delegate
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Workout", in: managedContext)!
            //Create an entity of Workout to store in core data
            let workout = NSManagedObject(entity: entity, insertInto: managedContext)
            //Store workout name in core data
            workout.setValue(workoutName, forKey: "name")
            
            //Iterate through all activities and store them in core data
            for activity in activities{
                var nsActivity = NSManagedObject(entity: NSEntityDescription.entity(forEntityName: "Activity", in: managedContext)!, insertInto: managedContext)
                
                nsActivity.setValue(activity.name, forKey: "name")
                nsActivity.setValue(activity.reps, forKey: "reps")
                nsActivity.setValue(activity.weight, forKey: "weight")
                //Store as a set in core data
                workout.setValue(NSSet(object: nsActivity), forKey: "activities")
            }
            
            
            do{
                //Save changes
                try managedContext.save()
                try workout.managedObjectContext?.save()
                
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark

      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
        
        //Register cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self //Set the datasource
    }
}
