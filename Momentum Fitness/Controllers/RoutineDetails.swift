//
//  RoutineDetails.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-20.
//

import UIKit
import FirebaseDatabase

class RoutineDetails: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle = 0
    
    
    //Get workout object passed along by segue
    var selectedWorkout: WorkoutObject?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var workoutName: UILabel!
    
    var workout = ""
    
    
    
    func getPost()
    {
       /** ref = Database.database().reference().child("workoutV")
        
        ref?.observeSingleEvent(of: .value, with: {
            (snapshot) in
            for workout in snapshot.children{
           let childSnap = workout as! DataSnapshot
           let value = childSnap.value as? NSDictionary*/
        
            }
       // })
    //}
    
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
        workoutName.text = "You selected\(workout) "
        
    print(workout)

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
