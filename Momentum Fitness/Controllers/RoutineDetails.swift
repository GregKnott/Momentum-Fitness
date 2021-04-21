//
//  RoutineDetails.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-20.
//

import UIKit

class RoutineDetails: UIViewController {
    
    var selectedWorkout: WorkoutObject?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var workoutName: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedWorkout?.activities.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityTableViewCell
        cell.activity = selectedWorkout?.activities[indexPath.item]
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        workoutName.text = selectedWorkout?.name
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
