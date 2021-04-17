//
//  WorkoutRoutineVC.swift
//  Momentum Fitness
//
//  Created by  on 4/2/21.
//

import UIKit

class WorkoutRoutineVC: UIViewController {
    
    var routineDataSource = RoutineDataSource()
    var tableView : UITableView = WorkoutRoutineTableView()
    
    @IBAction func saveRoutine(_ segue: UIStoryboardSegue) {
        let newWorkoutVC = segue.source as? NewWorkoutVC
        let workout = newWorkoutVC!.workout
        
        routineDataSource.append(newWorkout: workout!, to: tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
