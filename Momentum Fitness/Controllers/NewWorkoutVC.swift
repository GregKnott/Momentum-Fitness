//
//  NewWorkoutVC.swift
//  Momentum Fitness
//
//  Created by  on 4/2/21.
//

import UIKit

class NewWorkoutVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var workoutDataSource = NewWorkoutDataSource()
    var workout: Workout?
    @IBOutlet weak var tableView: NewWorkoutTableView!
    var activities: [Activity] = []
    
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
        activities.append(activity)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWorkoutToRoutine",
           let workoutName = workoutNameTextField.text{
            workout = Workout(name: workoutName, activities: activities)
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Workout", in: managedContext)!
            let workout = NSManagedObject(entity: entity, insertInto: managedContext)
            
            workout.setValue(workoutName, "name")
            workout.setValue(activities, "actvities")

            do{
                try managedContext.save()
                users.append(user)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self //set the datasource
    }
}
