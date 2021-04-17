//
//  NewWorkoutDataSource.swift
//  Momentum Fitness
//
//  Created by  on 4/16/21.
//

import Foundation
import UIKit

class NewWorkoutDataSource : NSObject {
    
    var activity: [Activity] = []
    
    static func generateActivityData() -> [Activity] {
        
        return [
            Activity(name: "Dumbell Curls", reps: "3 x 12", weight: "30 lbs"),
            Activity(name: "Barbell Bench Press", reps: "3 x 10", weight: "150 lbs"),
            Activity(name: "Barbell Squats", reps: "3 x 8", weight: "200 lbs")
        ]
    }
    
    override init() {
        activity = NewWorkoutDataSource.generateActivityData()
    }
    
    func numberOfActivity() -> Int {
        activity.count
    }
    
    func append(newActivity: Activity, to tableView: UITableView){
        activity.append(newActivity)
        tableView.insertRows(at: [IndexPath(row: activity.count-1, section: 0)], with: .automatic)
    }
    
    func activity(at IndexPath: IndexPath) -> Activity {
        activity[IndexPath.row]
    }
}
