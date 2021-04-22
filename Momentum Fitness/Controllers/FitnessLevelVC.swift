//
//  FitnessLevelVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit
import CoreData
import DLRadioButton

class FitnessLevelVC: UIViewController {
    
    //Create a blank array to be filled with core data
    var profileData: [NSManagedObject] = []
    var fitnessLevel: String = "Beginner" //Set a default value

    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
    
    @IBAction func beginnerRB(_ sender: Any) {
        //If user clicks on the beginner radio button, update the fitness level
        fitnessLevel = "Beginner"
    }
    
    @IBAction func intermediateRB(_ sender: Any) {
        //If user clicks on the intermediate radio button, update the fitness level
        fitnessLevel = "Intermediate"
    }
    
    @IBAction func advancedRB(_ sender: Any) {
        //If user clicks on the advanced radio button, update the fitness level
        fitnessLevel = "Advanced"
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
            //If profile records exist, continue
            if profileData.count > 0 {
                //Get first entry to add on to
                let fetchedData: Profile = profileData[0] as! Profile
                //Store fitness level in core storage
                fetchedData.setValue(fitnessLevel, forKey: "fitnessLevel");
            }
                    
        } catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
