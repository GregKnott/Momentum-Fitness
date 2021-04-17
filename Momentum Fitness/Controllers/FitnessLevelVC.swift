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
    
    var profileData: [NSManagedObject] = []
    var fitnessLevel: String = "Beginner"

    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
    
    @IBAction func beginnerRB(_ sender: Any) {
        fitnessLevel = "Beginner"
    }
    
    @IBAction func intermediateRB(_ sender: Any) {
        fitnessLevel = "Intermediate"
    }
    
    @IBAction func advancedRB(_ sender: Any) {
        fitnessLevel = "Advanced"
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
                        
                        fetchedData.setValue(fitnessLevel, forKey: "fitnessLevel");
                    }
                    
                } catch let error as NSError{
                    print("Could not fetch. \(error), \(error.userInfo)")
                }
    }
}
