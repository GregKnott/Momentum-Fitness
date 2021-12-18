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
    var timer = "20"
    var timer1 = "25"
    var timer2 = "30"
    var timer3 = "40"

   // var selectedWorkout: WorkoutObject?

    @IBOutlet var workoutImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var workoutName: UILabel!
   
    
    let Cadio = ["Jogging for 10 minutes", "Thread mills for 10 minutes", "Walking for 10  minutes"]
    let ChestDay = ["3 x Bench Press (150lbds)", "3 x Flies 8 reps (100lbs)", "3 x Diamond Push Ups 5 reps"]
    let LegDay = ["3 x Squats 10 reps", "3 x Leg Press (100lbs)", "3 x Jumping Jacks 5 reps"]
    let StrengthTraining = ["3 x Barbell Squat 10 reps (150lbs)", "3 x Barbell Bench Press (110lbs)", "3 x Pull ups 12 reps"]
        
    var workout = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutName.text = names
        workoutImage.image = UIImage(named:names)
    
        styleTopBar(nav: navigationItem)
        
  
        let nib = UINib(nibName: "RoutineTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "routine")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
   @IBAction func didTapped(sender: UIButton)
    {
       performSegue(withIdentifier: "vc1", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "vc1",
           let anotherViewController = segue.destination as? TImeTargetVC{
            anotherViewController.name = names
            
           if names == "Chest day"{
            anotherViewController.timer = timer
            }
            if names == "Leg Press"{
            anotherViewController.timer = timer1
            }
            
            else if names == "Strength Training"{
            anotherViewController.timer = timer2
            }
            
            else {
            anotherViewController.timer = timer3
            }
            
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
        return Cadio.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routine", for: indexPath) as! RoutineTableCell
     
        
     if names == "Chest day" {
       cell.workName?.text = ChestDay[indexPath.row]
       }
        
      else if names == "Leg Press" {
        cell.workName?.text = LegDay[indexPath.row]
        }
        
        
        else if names == "Strength Training" {
        cell.workName?.text = StrengthTraining[indexPath.row]
        }
        
        else  {
        cell.workName?.text = Cadio[indexPath.row]
       }
        return cell
    }
}
