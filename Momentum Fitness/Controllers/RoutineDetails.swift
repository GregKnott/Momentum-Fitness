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
    var names = ""
    
    
    //Get workout object passed along by segue
    var selectedWorkout: WorkoutObject?

    
    @IBOutlet var workoutImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var workoutName: UILabel!
   
    
    var workout = ""
    
    
    @IBAction func didTapped(sender: UIButton)
    {
       performSegue(withIdentifier: "vc1", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "vc1",
           let anotherViewController = segue.destination as? TImeTargetVC{
            anotherViewController.name = names
        }
    }
    
    
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActivityTableViewCell
        //Set activity in each row
        cell.activity = selectedWorkout?.activities[indexPath.row]
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        workoutName.text = names
        workoutImage.image = UIImage(named:names)
        
         print(names)
        styleTopBar(nav: navigationItem)
        
        //Register the cells
   
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self //set the datasource
    }
    
  /**  override func viewWillAppear(_ animated: Bool) {
        //Change title to workout name before view appears to user
        workoutName.text = selectedWorkout?.name
    }*/
}
