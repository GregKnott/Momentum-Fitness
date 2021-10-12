//
//  GenderVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit
import CoreData
import DLRadioButton

class GenderVC: UIViewController {
    
    var profileData: [NSManagedObject] = []
    var gender: String = "Male"

    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
    @IBAction func maleRB(_ sender: Any) {
        //If user clicks on the male gender radio button, update the gender
        gender = "Male"
    }
    @IBAction func femaleRB(_ sender: Any) {
        //If user clicks on the female gender radio button, update the gender
        gender = "Female"
    }
    @IBAction func otherRB(_ sender: Any) {
        //If user clicks on the other gender radio button, update the gender
        gender = "Other"
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
            //Check if there is an existing profile record
            if profileData.count > 0 {
                //Get the first entry to add to
                let fetchedData: Profile = profileData[0] as! Profile
                //Store gender in core data
                fetchedData.setValue(gender, forKey: "gender");
            }
            
        } catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
