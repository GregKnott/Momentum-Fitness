//
//  SignInVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit
import KeychainSwift

class SignInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errortext: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
       styleTopBar(nav: navigationItem)
    }
    
    @IBAction func signIn(_ sender: Any) {
        
        let email = emailText.text
        let password = passwordText.text
        
        if (email == "" || password == ""){
            errortext.text = "Fields cannot be blank"
            errortext.isHidden = false
        }
        else{
            let keychain = KeychainSwift()
                keychain.accessGroup = "VDQS4882Z8.ca.sheridancollege.Momentum-Fitness"
                if email == keychain.get("email"),
                   password == keychain.get("password") {
                    self.performSegue(withIdentifier: "signinSuccess", sender: (Any).self)
                }
                else {
                    errortext.text = "Invalid email or password"
                    errortext.isHidden = false
            }
        }
    }
}
