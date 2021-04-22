//
//  GoalVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit
import DLRadioButton
import CoreData

class GoalVC: UIViewController {
    
    var profileData: [NSManagedObject] = []

    //A variable to store the users last selection
    //This will be put in core storage
    var goal: String = "Lose weight" //Default value
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
    
    @IBAction func loseWeightRB(_ sender: DLRadioButton) {
        //If user clicks on the lose weight radio button, update the goal
        goal = "Lose weight"
    }
    
    @IBAction func maintainWeightRB(_ sender: DLRadioButton) {
        //If user clicks on the maintain weight radio button, update the goal
        goal = "Maintain weight"
    }
    
    @IBAction func gainWeightRB(_ sender: DLRadioButton) {
        //If user clicks on the gain weight radio button, update the goal
        goal = "Gain weight"
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        //Need a reference to app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
                
        //Get the container from app delegate
        let managedContext = appDelegate.persistentContainer.viewContext
            
        //Fetch Profile object from container
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Profile")
                
        do {
            profileData = try managedContext.fetch(fetchRequest)
            //Check if there are any existing records
            if profileData.count > 0 {
                //Get first entry
                let fetchedData: Profile = profileData[0] as! Profile
                //Store current goal value in local storage
                //Will overwrite any existing values
                fetchedData.setValue(goal, forKey: "goal");
            } else{
                //If there are no existing values, create new Profile entry
                let profileData = Profile(context: managedContext)
                //Store current goal value in local storage
                profileData.setValue(goal, forKey: "goal")
            }
                    
        } catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
}
