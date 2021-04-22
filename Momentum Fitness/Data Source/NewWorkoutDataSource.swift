//
//  NewWorkoutDataSource.swift
//  Momentum Fitness
//
//  Created by  on 4/16/21.
//

import Foundation
import UIKit
import CoreData

class NewWorkoutDataSource : NSObject {
    
    //A blank array to store activity objects into
    var activity: [ActivityObject] = []
    //A blank array to store fetched core data
    var coreData: [NSManagedObject] = []
    
    //A function to generate sample activity data
    static func generateActivityData() -> [ActivityObject] {
        
        return [
            ActivityObject(name: "Dumbell Curls", reps: "3 x 12", weight: "30 lbs"),
            ActivityObject(name: "Barbell Bench Press", reps: "3 x 10", weight: "150 lbs"),
            ActivityObject(name: "Barbell Squats", reps: "3 x 8", weight: "200 lbs")
        ]
    }
    
    override init() {
        //A reference to app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
                        
        //Get the container from app delegate
        let managedContext = appDelegate.persistentContainer.viewContext
                        
        //Fetch activity object from core data
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Activity")
                        
        do {
            //Perform a fetch request for data
            coreData = try managedContext.fetch(fetchRequest)
            //If results are not empty continue
            if coreData.count > 0 {
                //Read all data in core storage and iterate through to store activities
                for data in coreData{
                    let coreName: String? = data.value(forKey: "name") as? String
                    let coreReps: String? = data.value(forKey: "reps") as? String
                    let coreWeight: String? = data.value(forKey: "weight") as? String
                    //Create a new Activity object made from core data
                    var newActivity = ActivityObject(name: coreName!, reps: coreReps!, weight: coreWeight!)
                    //Add activity to global array
                    activity.append(newActivity)
                }
            }
            
            else{
                //If there are no entries at the start, generate and provide sample ones
                activity = NewWorkoutDataSource.generateActivityData()
            }
                            
        } catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    //A method to return the number of activities
    func numberOfActivity() -> Int {
        activity.count
    }
    
    //A method to add a new activity to the provided table
    func append(newActivity: ActivityObject, to tableView: UITableView){
        activity.append(newActivity)
        tableView.insertRows(at: [IndexPath(row: activity.count-1, section: 0)], with: .automatic)
    }
    
    //A method to return the activity at the provided index
    func activity(at IndexPath: IndexPath) -> ActivityObject {
        activity[IndexPath.row]
    }
}
