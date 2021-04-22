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
        //Create a new KeychainSwift object to connect to Keychain
        let keychain = KeychainSwift()
        //Set the access group for keychain
        keychain.accessGroup = "VDQS4882Z8.ca.sheridancollege.Momentum-Fitness"
        //Get the name stored in keychain
        nameLabel.text = keychain.get("name")
        
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
            //Check if records are not empty
            if profileData.count > 0 {
                //Fet first entry
                let fetchedData: Profile = profileData[0] as! Profile
                //Display details on screen
                detailsTV.text = "Goal: \(fetchedData.goal ?? "") \nFitness level: \(fetchedData.fitnessLevel ?? "") \nGender: \(fetchedData.gender ?? "") \nHeight \(fetchedData.height) \nWeight: \(fetchedData.weight ?? 0)"
            }
                            
        } catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
