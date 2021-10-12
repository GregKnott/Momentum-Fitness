//
//  SignInVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    var signInlabel: UILabel?
    var emailText : UITextField?
    var passwordText  : UITextField?
    var errortext : UITextField?

    var signInButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
              //  self.performSegue(withIdentifier: self.loginToList, sender: nil)
                self.emailText!.text = nil
                self.passwordText!.text = nil
            }
        }
       styleTopBar(nav: navigationItem)
        self.view.backgroundColor = UIColor.green
        
        
        
        //This is the label for the Sign In page
        signInlabel = UILabel(frame: CGRect(x:150, y: 200, width: 320.00, height: 50.00));
        self.view.addSubview(signInlabel!)
        signInlabel!.font = UIFont.boldSystemFont(ofSize: 30)
        signInlabel!.text = "Sign In"
    
        
        
        //this emailtext for this VC
        emailText = UITextField(frame: CGRect(x:50, y: 300, width: 320.00, height: 50.00));
        self.view.addSubview(emailText!)
        
        //emailText!.center = self.view.center
        emailText!.placeholder = "Email"
        
        emailText?.borderStyle = UITextField.BorderStyle.line
        
        emailText!.backgroundColor = UIColor.white
        
        
        
        
        //this passwordText for this VC
        passwordText = UITextField(frame: CGRect(x:50, y: 400, width: 320.00, height: 50.00));
        self.view.addSubview(passwordText!)
        
       // passwordText!.center = self.view.center
        passwordText!.placeholder = "Password"
        
        passwordText?.borderStyle = UITextField.BorderStyle.line
        
        passwordText!.backgroundColor = UIColor.white
        
    
        
        signInButton = UIButton()
        signInButton?.setBackgroundImage(UIImage(named: "Signin"), for: .normal)
        signInButton?.imageView?.contentMode = .scaleAspectFill
        self.view.addSubview(signInButton!)
        signInButton?.translatesAutoresizingMaskIntoConstraints = false
        signInButton?.topAnchor.constraint(equalTo: view.topAnchor, constant:500).isActive = true
        signInButton?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier : 1.0).isActive = true
        signInButton?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier : 0.2).isActive = true
        signInButton?.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier : 0.5).isActive = true
        signInButton?.addTarget(self, action: #selector(SignInVC.upBtnPressed), for: UIControl.Event.touchUpInside)
    }
    
    
    
    @objc func upBtnPressed()
    {
        
       /** let email = emailText!.text
        let password = passwordText!.text
        
        if (email == "" || password == ""){
            errortext!.text = "Fields cannot be blank"
            errortext!.isHidden = false
        }
        
        
        else{
            //perform a login with this information
            Auth.auth().signIn(withEmail: emailText!.text!, password: passwordText!.text!) { user, error in
                //if the sign in does not work, we will show a alert controller that says sign in failed
                if let error = error, user == nil {
                    let alert = UIAlertController(title: "Sign In Failed", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    
                    //present the alert
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
                    self.performSegue(withIdentifier: "signinSuccess", sender: (Any).self)
        }
        
        
        
        let homeVC = HomeVC()
        navigationController?.pushViewController(homeVC, animated: true)
    }*/

        
    }
}


