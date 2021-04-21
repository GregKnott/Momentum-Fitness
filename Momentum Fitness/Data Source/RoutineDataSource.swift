//
//  RoutineDataSource.swift
//  Momentum Fitness
//
//  Created by  on 4/16/21.
//

import Foundation

import UIKit
import CoreData

class RoutineDataSource: NSObject {
    
    var workout: [WorkoutObject] = []
    var coreData: [NSManagedObject] = []
    
    static func generateWorkoutData() -> [WorkoutObject] {
        
        return [
            WorkoutObject(name: "Full Body Workout",activities: []),
            WorkoutObject(name: "Resistance Band Home Workout", activities: []),
            WorkoutObject(name: "Back & Bicep Workout", activities: []),
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
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Workout")
                        
        do {
            coreData = try managedContext.fetch(fetchRequest)
            //perform a search inside container to retrieve this object
            if coreData.count > 0 {
                //clear array to re-add
                workout.removeAll()
                //add sample data
                workout = RoutineDataSource.generateWorkoutData()
                
                //read all data in core storage and iterate thorugh to append to activities
                for data in coreData{
                    let coreName: String? = data.value(forKey: "name") as? String
                    var finalActivities: [ActivityObject] = []
                    let coreActivities = data.value(forKey: "activities") as? Set<NSManagedObject>
                    if (coreActivities != nil){
                        for activity in coreActivities! {
                            let activityName = activity.value(forKey: "name") as? String
                            let activityReps = activity.value(forKey: "reps") as? String
                            let activityWeight = activity.value(forKey: "weight") as? String

                            let activityObject: ActivityObject = ActivityObject(name: activityName!, reps: activityReps!, weight: activityWeight!)
                            finalActivities.append(activityObject)
                        }
                    }
                        //Create a new Activity object to store in coredata
                    let newWorkout = WorkoutObject(name: coreName!, activities: finalActivities)
                        workout.append(newWorkout)
                }
            }
            
            else{
                //if there are no entries at the start, generate sample ones
                workout = RoutineDataSource.generateWorkoutData()
                
            }
                            
        } catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func numberOfWorkout() -> Int {
        workout.count
    }
    
    func append(newWorkout: WorkoutObject, to tableView: UITableView){
        workout.append(newWorkout)
        tableView.insertRows(at: [IndexPath(row: workout.count-1, section: 0)], with: .automatic)
    }
    
    func workout(at IndexPath: IndexPath) -> WorkoutObject {
        workout[IndexPath.row]
    }}
