//
//  ActivityTableVC.swift
//  Momentum Fitness
//
//  Created by  on 4/16/21.
//

import UIKit
import CoreData

class ActivityTableVC: UITableViewController {
    
    var activity: ActivityObject?
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var repsTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
        Creates a new activity and sets the name, reps and weight properties based on the input in the text fields and
        stores the activity in Core Data when the user returns to the previous view controller/page
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "AddActivityToWorkout",
           let activityName = nameTextField.text,
           let activityReps = repsTextField.text,
           let activityWeight = weightTextField.text {
            activity = ActivityObject(name: activityName, reps: activityReps, weight: activityWeight)
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Activity", in: managedContext)!
            let activity = NSManagedObject(entity: entity, insertInto: managedContext)
            
            activity.setValue(activityName, forKey: "name")
            activity.setValue(activityReps, forKey: "reps")
            activity.setValue(activityWeight, forKey: "weight")

            do{
                try managedContext.save()
                
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
}
