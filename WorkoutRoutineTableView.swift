//
//  WorkoutRoutineTableView.swift
//  Momentum Fitness
//
//  Created by  on 4/16/21.
//

import UIKit

class WorkoutRoutineTableView: UITableView {
    
    //Create a new RoutineDataSource to fill the table
    var routineDataSource = RoutineDataSource()

    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        //Use the cell template
        let cell = dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! WorkoutTableViewCell
        //Set the workout object of the cell to the correct Workout object
        cell.workout = routineDataSource.workout(at: indexPath)
        return cell
    }
    
    //A method to set number of rows to number of workouts
    override func numberOfRows(inSection section: Int) -> Int {
        return routineDataSource.numberOfWorkout()
    }}
