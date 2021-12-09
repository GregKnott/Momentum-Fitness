//
//  WorkoutRoutineVC.swift
//  Momentum Fitness
//
//  Created by  on 4/2/21.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class WorkoutRoutineVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    var routineDataSource = RoutineDataSource()
    //var tableView : UITableView = WorkoutRoutineTableView()
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle = 0
    
    let myData = ["footExcercise", "running", "benchpress", "benchpress"]
    let myData1 = ["Chest day", "Leg Press", "Strength Training", "Running"]
    //var post = [postStruct]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
        
        let nib = UINib(nibName: "Workout_routine_tableViewTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        getUsersData()
            //getPosts()
    }
    
    
    func getUsersData(){
      guard let userID = Auth.auth().currentUser?.uid else { return }
      Database.database().reference().child("userId").child(userID).observeSingleEvent(of: .value) { (snapshot) in
        if let postDict = snapshot.value as? [String : AnyObject] {
          self.tableView.reloadData()
        }
      }
    }
     
    struct postStruct {
       let routine : String!
        let routine1 : String!
        let routine2 : String!
        let routine3 : String!
        
    }
     
  /**  func getPosts() {
        let databaseRef = Database.database().reference()
        databaseRef.child("workout").queryOrderedByKey().observeSingleEvent(of: .childAdded, with: {
            snapshot in
            let routine = (snapshot.value as? NSDictionary)!["routine"]
            let routine1 = (snapshot.value as? NSDictionary)!["routine1"]
            let routine2 = (snapshot.value as? NSDictionary)!["routine2"]
            let routine3 = (snapshot.value as? NSDictionary)!["routine3"]
            self.post.append(postStruct(routine: routine as? String, routine1: routine1 as? String, routine2: routine2 as? String, routine3: routine3 as? String))
            DispatchQueue.main.async {
              self.tableView.reloadData()
            }
          })
    }*/
        
        
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData1.count
    }

        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Workout_routine_tableViewTableViewCell
        
        
        cell.workoutRoutine?.text = myData1[indexPath.row]
        cell.workoutImage?.image  = UIImage(named: myData[indexPath.row])

        return cell
    }
    
    
        func saveRoutine(_ segue: UIStoryboardSegue) {
        let newWorkoutVC = segue.source as? NewWorkoutVC
        let workout = newWorkoutVC!.workoutObject
        
        //routineDataSource.append(newWorkout: workout!, to: tableView)
    }
    
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Routinedetails") as? RoutineDetails
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}




