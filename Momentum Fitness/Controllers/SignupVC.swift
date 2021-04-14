//
//  SignupVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit
import KeychainSwift

class SignupVC: UIViewController {
    
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
        
        if (confirmPassword.text == passwordText.text){
            guard let email = self.emailText.text,
                  let password = self.passwordText.text else { return }
                
            let keychain = KeychainSwift()
            //${AppIdentifierPrefix} is the Prefix (or TeamID) that is taken from the App ID in the Apple Developer Account portal.
            keychain.accessGroup = "VDQS4882Z8.ca.sheridancollege.Momentum-Fitness"
            keychain.set(email, forKey: "email")
            keychain.set(password, forKey: "password")
        }
        else if (passwordText.text == nil || emailText.text == nil){
            errorText.text = "Fields cannot be left blank"
            errorText.isHidden = false
        }
        else{
            errorText.text = "Passwords do not match"
            errorText.isHidden = false
        }
    }
    
}
