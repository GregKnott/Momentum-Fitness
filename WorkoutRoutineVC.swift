//
//  WorkoutRoutineVC.swift
//  Momentum Fitness
//
//  Created by  on 4/2/21.
//

import UIKit

class WorkoutRoutineVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var routineDataSource = RoutineDataSource()
    //var tableView : UITableView = WorkoutRoutineTableView()
    
    @IBOutlet weak var tableView: WorkoutRoutineTableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routineDataSource.numberOfWorkout()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! WorkoutTableViewCell
        
        cell.workout = routineDataSource.workout(at: indexPath)
        return cell
    }
    
    @IBAction func saveRoutine(_ segue: UIStoryboardSegue) {
        let newWorkoutVC = segue.source as? NewWorkoutVC
        let workout = newWorkoutVC!.workoutObject
        
        routineDataSource.append(newWorkout: workout!, to: tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self //set the datasource
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //If segue identifier is routineDetails, continue
        if (segue.identifier == "routineDetails"){
            //Retrieve the current Workout object in the table
            let workoutDetails: WorkoutObject = routineDataSource.workout(at: tableView.indexPathForSelectedRow!)
            //Set redirect location
            var routineDetails =  segue.destination as! RoutineDetails
            //Pass along the selected Workout object
            routineDetails.selectedWorkout = workoutDetails
        }
    }
}
