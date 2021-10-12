//
//  NewWorkoutTableView.swift
//  Momentum Fitness
//
//  Created by  on 4/16/21.
//

import UIKit

class NewWorkoutTableView: UITableView {
    //Create a neww workout data source
    var workoutDataSource = NewWorkoutDataSource()
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        //Use the cell template
        let cell = dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityTableViewCell
        //Set the activity object of the cell to the correct activity object
        cell.activity = workoutDataSource.activity(at: indexPath)
        return cell
    }
    
    //A method to set number of rows to number of workouts
    override func numberOfRows(inSection section: Int) -> Int {
        return workoutDataSource.numberOfActivity()
    }
}
