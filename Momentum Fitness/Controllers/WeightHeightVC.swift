//
//  WeightHeightVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit
import CoreData
import DLRadioButton

class WeightHeightVC: UIViewController {
    
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    var profileData: [NSManagedObject] = []
    var weight = 0.0
    var height = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
    
    @IBAction func getStartedClicked(_ sender: Any) {
        
        weight = Double(weightTF.text!) ?? 0
        height = Int(heightTF.text!) ?? 0
        
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
                        
                        fetchedData.setValue(height, forKey: "height");
                        fetchedData.setValue(weight, forKey: "weight");
                        
                        print("Goal \(fetchedData.goal) \nFitness level \(fetchedData.fitnessLevel) \nGender: \(fetchedData.gender) \nHeight \(height) \nWeight: \(weight)")
                    }
                    
                } catch let error as NSError{
                    print("Could not fetch. \(error), \(error.userInfo)")
                }
    }
}
