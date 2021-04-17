//
//  RoutineDataSource.swift
//  Momentum Fitness
//
//  Created by  on 4/16/21.
//

import Foundation

import UIKit

class RoutineDataSource: NSObject {
    
    var workout: [Workout] = []
    
    static func generateWorkoutData() -> [Workout] {
        
        return [
            Workout(name: "Full Body Workout"),
            Workout(name: "Resistance Band Home Workout"),
            Workout(name: "Back & Bicep Workout"),
        ]
    }
    
    override init() {
        workout = RoutineDataSource.generateWorkoutData()
    }
    
    func numberOfWorkout() -> Int {
        workout.count
    }
    
    func append(newWorkout: Workout, to tableView: UITableView){
        activity.append(newWorkout)
        tableView.insertRows(at: [IndexPath(row: workout.count-1, section: 0)], with: .automatic)
    }
    
    func workout(at IndexPath: IndexPath) -> Workout {
        workout[IndexPath.row]
    }}
