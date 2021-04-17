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
    var goal: String = "Lose weight" //default value
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
    
    @IBAction func loseWeightRB(_ sender: DLRadioButton) {
        goal = "Lose weight"
    }
    
    @IBAction func maintainWeightRB(_ sender: DLRadioButton) {
        goal = "Maintain weight"
    }
    
    @IBAction func gainWeightRB(_ sender: DLRadioButton) {
        goal = "Gain weight"
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        //need a reference to app delegate
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
                
                //get the container from app delegate
                let managedContext = appDelegate.persistentContainer.viewContext
                
                //fetch person object from container
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Profile")
                
                do {
                    profileData = try managedContext.fetch(fetchRequest)
                    //perform a search inside container to retrieve this object
                    if profileData.count > 0 {
                        //get first entry
                        let fetchedData: Profile = profileData[0] as! Profile
                        //store in variable
                        
                        fetchedData.setValue(goal, forKey: "goal");
                    }
                    
                } catch let error as NSError{
                    print("Could not fetch. \(error), \(error.userInfo)")
                }
    }
    
}
