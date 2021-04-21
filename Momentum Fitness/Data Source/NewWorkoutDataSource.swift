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
    
    var activity: [ActivityObject] = []
    var coreData: [NSManagedObject] = []
    
    static func generateActivityData() -> [ActivityObject] {
        
        return [
            ActivityObject(name: "Dumbell Curls", reps: "3 x 12", weight: "30 lbs"),
            ActivityObject(name: "Barbell Bench Press", reps: "3 x 10", weight: "150 lbs"),
            ActivityObject(name: "Barbell Squats", reps: "3 x 8", weight: "200 lbs")
        ]
    }
    
    override init() {
        //need a reference to app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
                        
        //get the container from app delegate
        let managedContext = appDelegate.persistentContainer.viewContext
                        
        //fetch person object from container
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Activity")
                        
        do {
            coreData = try managedContext.fetch(fetchRequest)
            //perform a search inside container to retrieve this object
            if coreData.count > 0 {
                //read all data in core storage and iterate thorugh to append to activities
                for data in coreData{
                    let coreName: String? = data.value(forKey: "name") as? String
                    let coreReps: String? = data.value(forKey: "reps") as? String
                    let coreWeight: String? = data.value(forKey: "weight") as? String
                    //Create a new Activity object to store in coredata
                    var newActivity = ActivityObject(name: coreName!, reps: coreReps!, weight: coreWeight!)
                    
                    activity.append(newActivity)
                }
            }
            
            else{
                //if there are no entries at the start, generate sample ones
                activity = NewWorkoutDataSource.generateActivityData()
            }
                            
        } catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func numberOfActivity() -> Int {
        activity.count
    }
    
    func append(newActivity: ActivityObject, to tableView: UITableView){
        activity.append(newActivity)
        tableView.insertRows(at: [IndexPath(row: activity.count-1, section: 0)], with: .automatic)
    }
    
    func activity(at IndexPath: IndexPath) -> ActivityObject {
        activity[IndexPath.row]
    }
}
