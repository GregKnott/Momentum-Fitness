//
//  RoutineDetails.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-20.
//

import UIKit

class RoutineDetails: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Get workout object passed along by segue
    var selectedWorkout: WorkoutObject?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var workoutName: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedWorkout?.activities.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityTableViewCell
        //Set activity in each row
        cell.activity = selectedWorkout?.activities[indexPath.row]
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
        
        //Register the cells
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self //set the datasource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Change title to workout name before view appears to user
        workoutName.text = selectedWorkout?.name
    }
}
