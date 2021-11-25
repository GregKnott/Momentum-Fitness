//
//  AccountNavigationVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit
import Firebase
import GoogleSignIn

class AccountNavigationVC: UIViewController {
    var signUpbutton: UIButton?
    var signIn: UIButton?
    var text1: UITextField?
    var text2: UITextField?
    var logoImage: UIImageView?

    
    
 @IBOutlet var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(named: "Theme")

        styleTopBar(nav: navigationItem)
        
        logoImage  = UIImageView(image: UIImage(named: "logo"))
        self.view.addSubview(logoImage!)
        
        logoImage!.translatesAutoresizingMaskIntoConstraints = false
        
        logoImage?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.20).isActive = true
        logoImage?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.10).isActive = true
        logoImage?.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor,  multiplier: 0.33).isActive = true
        logoImage?.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        

        text1  = UITextField()
        view.addSubview(text1!)
        text1!.text = "Create a new Account"
        text1!.font = UIFont(name: "Avenir", size: 22)
        
        text1!.font = UIFont.boldSystemFont(ofSize: 30)
        text1!.textColor = UIColor.white
        
        text1!.translatesAutoresizingMaskIntoConstraints = false
        
        text1?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.80).isActive = true
        text1?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0).isActive = true
        text1?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,  constant:15).isActive = true
        text1?.topAnchor.constraint(equalTo: view.topAnchor, constant: 210).isActive = true
        
        
        
        text2  = UITextField()
        view.addSubview(text2!)
        text2!.text = "or Signin to new Account"
        text2!.font = UIFont(name: "Avenir", size: 22)
        
        text2!.font = UIFont.boldSystemFont(ofSize: 30)
        text2!.textColor = UIColor.white
        
        text2!.translatesAutoresizingMaskIntoConstraints = false
        
        text2?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.80).isActive = true
        text2?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0).isActive = true
        text2?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,  constant:10).isActive = true
        text2?.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        
        

      signIn = UIButton()
        signIn?.setBackgroundImage(UIImage(named: "Signin"), for: .normal)
        signIn?.imageView?.contentMode = .scaleAspectFill
        self.view.addSubview(signIn!)
        
        signIn?.translatesAutoresizingMaskIntoConstraints = false
        signIn?.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        signIn?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier : 1.0).isActive = true
        signIn?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier : 0.2).isActive = true
        
        signIn?.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier : 0.5).isActive = true
         signIn?.addTarget(self, action: #selector(AccountNavigationVC.upBtnPressed), for: UIControl.Event.touchUpInside)
   
        
        
        signUpbutton = UIButton()
        signUpbutton?.setBackgroundImage(UIImage(named: "Signup"), for: .normal)
        signUpbutton?.imageView?.contentMode = .scaleAspectFill
        self.view.addSubview(signUpbutton!)
        
        signUpbutton?.translatesAutoresizingMaskIntoConstraints = false
        signUpbutton?.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        signUpbutton?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier : 1.0).isActive = true
        signUpbutton?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier : 0.2).isActive = true
        signUpbutton?.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier : 0.5).isActive = true
        signUpbutton?.addTarget(self, action: #selector(AccountNavigationVC.signUpBtnPressed), for: UIControl.Event.touchUpInside)
   

        
        signInButton
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
            // ...
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          //let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         //accessToken: authentication.accessToken)

          // ...
        }
        
        
    }
    
    
    
    @objc func upBtnPressed(sender: UIButton!)
    {
        let SignInVC = SignInVC()
        navigationController?.pushViewController(SignInVC, animated: true)
    }
    
    
    
    @objc func signUpBtnPressed(sender: UIButton!)
    {
        let SignupVC = SignupVC()
        navigationController?.pushViewController(SignupVC, animated: true)
    }
    
}


