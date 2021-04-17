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

        // Do any additional setup after loading the view.
        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
       styleTopBar(nav: navigationItem)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
        
        let keychain = KeychainSwift()
            keychain.accessGroup = "VDQS4882Z8.ca.sheridancollege.Momentum-Fitness"
        
        let date = Date()
        var calendar = Calendar.current

        if let timeZone = TimeZone(identifier: "EST") {
           calendar.timeZone = timeZone
        }

        let hour = calendar.component(.hour, from: date)
        
        var greeting: String = "Hello"
        
        switch hour {
        case 0 ... 11:
            greeting = "Good morning"
            backgroundImage.image = UIImage(named: "homeMorning")
        case 12 ... 17:
            greeting = "Hello"
            backgroundImage.image = UIImage(named: "homeNoon")
        default:
            greeting = "Good evening"
            backgroundImage.image = UIImage(named: "homeNight")
        }
        
        greetingLabel.text = "\(greeting), \(keychain.get("name") ?? "")"
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
