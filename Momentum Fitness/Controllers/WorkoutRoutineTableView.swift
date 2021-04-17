//
//  WorkoutRoutineTableView.swift
//  Momentum Fitness
//
//  Created by  on 4/16/21.
//

import UIKit

class WorkoutRoutineTableView: UITableView {
    
    var routineDataSource = RoutineDataSource()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        
        let cell = dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! WorkoutTableViewCell
        
        cell.workout = routineDataSource.workout(at: indexPath)
        return cell
    }
    
    
    override func numberOfRows(inSection section: Int) -> Int {
        return routineDataSource.numberOfWorkout()
    }}
