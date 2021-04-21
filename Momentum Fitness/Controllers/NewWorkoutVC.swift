//
//  NewWorkoutVC.swift
//  Momentum Fitness
//
//  Created by  on 4/2/21.
//

import UIKit
import CoreData

class NewWorkoutVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var workoutDataSource = NewWorkoutDataSource()
    var workoutObject: WorkoutObject?
    @IBOutlet weak var tableView: NewWorkoutTableView!
    var activities: [ActivityObject] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutDataSource.numberOfActivity()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityTableViewCell
        
        cell.activity = workoutDataSource.activity(at: indexPath)
        return cell
    }
    
    @IBOutlet weak var workoutNameTextField: UITextField!
    
    @IBAction func cancelToNewWorkoutVC(_ segue: UIStoryboardSegue){
        
    }
    
    @IBAction func addActivity(_ segue: UIStoryboardSegue) {
        let activityTableVC = segue.source as? ActivityTableVC
        let activity = activityTableVC!.activity
        workoutDataSource.append(newActivity: activity!, to: tableView)
        activities.append(activity!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWorkoutToRoutine",
           let workoutName = workoutNameTextField.text{
            workoutObject = WorkoutObject(name: workoutName, activities: activities)
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Workout", in: managedContext)!
            let workout = NSManagedObject(entity: entity, insertInto: managedContext)
            workout.setValue(workoutName, forKey: "name")
            
            for activity in activities{
                var nsActivity = NSManagedObject(entity: NSEntityDescription.entity(forEntityName: "Activity", in: managedContext)!, insertInto: managedContext)
                
                nsActivity.setValue(activity.name, forKey: "name")
                nsActivity.setValue(activity.reps, forKey: "reps")
                nsActivity.setValue(activity.weight, forKey: "weight")
                workout.setValue(NSSet(object: nsActivity), forKey: "activities")
            }
            
            
            do{
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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self //set the datasource
    }
}
