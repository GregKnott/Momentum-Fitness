//
//  RoutineDetailsTableView.swift
//  Momentum Fitness
//
//  Created by  on 4/20/21.
//

import UIKit

class RoutineDetailsTableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        
        let cell = dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityTableViewCell
        
        cell.activity = routineDataSource.workout(at: indexPath)
        return cell
    }
    
    
    override func numberOfRows(inSection section: Int) -> Int {
        return routineDataSource.numberOfWorkout()
    }
}
