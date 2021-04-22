//
//  SignupVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit
import KeychainSwift

class SignupVC: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        //If fields are left blank do not let the user continue
        if (passwordText.text == "" || emailText.text == "" || nameText.text == ""){
            //Update error text with message
            errorText.text = "Fields cannot be left blank"
            //Show error text
            errorText.isHidden = false
        }
        else if (confirmPassword.text != passwordText.text){
            errorText.text = "Passwords do not match"
            errorText.isHidden = false
        }
        else{
            guard let email = self.emailText.text,
                  let password = self.passwordText.text,
                  let name = nameText.text
            else { return }
                
            //Create a new KeychainSwift object to connect to keychain
            let keychain = KeychainSwift()
            //Set up keychain to connect to correct access group
            keychain.accessGroup = "VDQS4882Z8.ca.sheridancollege.Momentum-Fitness"
            //Store email in keychain
            keychain.set(email, forKey: "email")
            //Store password in keychain
            keychain.set(password, forKey: "password")
            //Store name in keychain
            keychain.set(name, forKey: "name")
            //Redirect user to survey page
            self.performSegue(withIdentifier: "signupSuccess", sender: (Any).self)
        }
    }
    
}
