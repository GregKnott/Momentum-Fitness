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
    
    //A blank array to store workout objects
    var workout: [WorkoutObject] = []
    //A blank array to store fetched core data
    var coreData: [NSManagedObject] = []
    
    //A function to generate sample routine data
    static func generateWorkoutData() -> [WorkoutObject] {
        
        return [
            WorkoutObject(name: "Full Body Workout",activities: []),
            WorkoutObject(name: "Resistance Band Home Workout", activities: []),
            WorkoutObject(name: "Back & Bicep Workout", activities: []),
        ]
    }
    
    override init() {
        //A reference to app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
                        
        //Get the container from app delegate
        let managedContext = appDelegate.persistentContainer.viewContext
                        
        //Fetch workout object from core data
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Workout")
                        
        do {
            //Perform a fetch request for data
            coreData = try managedContext.fetch(fetchRequest)
            //If results are not empty continue
            if coreData.count > 0 {
                //Clear array to re-add entries
                workout.removeAll()
                //Add sample data
                workout = RoutineDataSource.generateWorkoutData()
                
                //Read all data in core storage and iterate through to store activities
                for data in coreData{
                    //Store workout name in variable
                    let coreName: String? = data.value(forKey: "name") as? String
                    //Create an array of all activities found
                    var finalActivities: [ActivityObject] = []
                    //Get set of activities attached to this workout
                    let coreActivities = data.value(forKey: "activities") as? Set<NSManagedObject>
                    
                    //If set returned was not nil continue
                    if (coreActivities != nil){
                        //Iterate through each activity returned
                        for activity in coreActivities! {
                            let activityName = activity.value(forKey: "name") as? String
                            let activityReps = activity.value(forKey: "reps") as? String
                            let activityWeight = activity.value(forKey: "weight") as? String

                            //Create an activity object with values from core storage
                            let activityObject: ActivityObject = ActivityObject(name: activityName!, reps: activityReps!, weight: activityWeight!)
                            //Add the activity to the list of all activities
                            finalActivities.append(activityObject)
                        }
                    }
                    
                    //Create a new Activity object to store and retrieve from array
                    let newWorkout = WorkoutObject(name: coreName!, activities: finalActivities)
                    workout.append(newWorkout)
                }
            }
            
            else{
                //If there are no entries at the start, generate and provide sample ones
                workout = RoutineDataSource.generateWorkoutData()
                
            }
                            
        } catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    //A method to return the number of workouts
    func numberOfWorkout() -> Int {
        workout.count
    }
    
    //A method to add a new workout to the provided table
    func append(newWorkout: WorkoutObject, to tableView: UITableView){
        workout.append(newWorkout)
        tableView.insertRows(at: [IndexPath(row: workout.count-1, section: 0)], with: .automatic)
    }
    
    //A method to return the activity at the provided index
    func workout(at IndexPath: IndexPath) -> WorkoutObject {
        workout[IndexPath.row]
    }}
