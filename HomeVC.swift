//
//  HomeVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit
import KeychainSwift

class HomeVC: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
       styleTopBar(nav: navigationItem)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
        //Create a new KeychainSwift object to connect to keychain
        let keychain = KeychainSwift()
            keychain.accessGroup = "VDQS4882Z8.ca.sheridancollege.Momentum-Fitness"
        
        //Get current date and time
        let date = Date()
        var calendar = Calendar.current

        //Set the time zone
        if let timeZone = TimeZone(identifier: "EST") {
           calendar.timeZone = timeZone
        }

        let hour = calendar.component(.hour, from: date)
        
        //A default greeting or the user
        var greeting: String = "Hello"
        
        //Depending on the current time change the
        //background image, as well as the greeting
        switch hour {
        case 0 ... 11:
            //Set morning settings
            greeting = "Good morning"
            backgroundImage.image = UIImage(named: "homeMorning")
        case 12 ... 17:
            //Set daytime settings
            greeting = "Hello"
            backgroundImage.image = UIImage(named: "homeNoon")
        default:
            //Set night time settings
            greeting = "Good evening"
            backgroundImage.image = UIImage(named: "homeNight")
        }
        //Update greeting label with name and custom greeting
        greetingLabel.text = "\(greeting), \(keychain.get("name") ?? "")"
    }
}
