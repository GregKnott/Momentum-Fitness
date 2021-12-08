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
    
    let myData = ["footExcercise"/**, "running", "benchpress"*/]
    var post = [postStruct]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
        
        let nib = UINib(nibName: "Workout_routine_tableViewTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        getUsersData()
            getPosts()
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
      //let workout : String!
      let routine : String!
    }
     
    func getPosts() {
        let databaseRef = Database.database().reference()
      databaseRef.child("workoutV").queryOrderedByKey().observeSingleEvent(of: .childAdded, with: {
            snapshot in
            let workout = (snapshot.value as? NSDictionary)!["workout"] as? String
            let routine = (snapshot.value as? NSDictionary
              )!["routine"] as? String
            self.post.append(postStruct(routine: routine))
            DispatchQueue.main.async {
              self.tableView.reloadData()
            }
          })
    }
        
        
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }

        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Workout_routine_tableViewTableViewCell
        
        
        cell.workoutRoutine?.text = post[indexPath.row].routine
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




