//
//  UserProfileVC.swift
//  Momentum Fitness
//
//  Created by  on 4/2/21.
//

import UIKit
import CoreData
import KeychainSwift

class UserProfileVC: UIViewController {
    
    var profileData: [NSManagedObject] = []

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsTV: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
        let keychain = KeychainSwift()
            keychain.accessGroup = "VDQS4882Z8.ca.sheridancollege.Momentum-Fitness"
        
        nameLabel.text = keychain.get("name")
        
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
                                
                                detailsTV.text = "Goal: \(fetchedData.goal ?? "") \nFitness level: \(fetchedData.fitnessLevel ?? "") \nGender: \(fetchedData.gender ?? "") \nHeight \(fetchedData.height) \nWeight: \(fetchedData.weight ?? 0)"
                            }
                            
                        } catch let error as NSError{
                            print("Could not fetch. \(error), \(error.userInfo)")
                        }
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
