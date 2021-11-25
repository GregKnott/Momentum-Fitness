//
//  SignupVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//
import UIKit
import Firebase
import CoreData
import GoogleSignIn


class SignupVC: UIViewController {
    var signuplabel: UILabel?
    var nameText: UITextField?
    var errorText: UITextField?
    var emailText : UITextField?
    var passwordText : UITextField?
    var confirmPassword :  UITextField?
    var signupBtn: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleTopBar(nav: navigationItem)
        
        self.view.backgroundColor = UIColor.init(named: "Theme")
        
        
        //This is the label for the Sign In page
        signuplabel = UILabel(frame: CGRect(x:150, y: 200, width: 320.00, height: 50.00));
        self.view.addSubview(signuplabel!)
        signuplabel!.font = UIFont.boldSystemFont(ofSize: 30)
        signuplabel!.text = "Sign Up"
    
        
        
        nameText = UITextField(frame: CGRect(x:50, y: 200, width: 320.00, height: 50.00));
        self.view.addSubview(nameText!)
        nameText!.placeholder = "Name"
        nameText?.borderStyle = UITextField.BorderStyle.line
        nameText?.backgroundColor = UIColor.white

        
        
        emailText = UITextField(frame: CGRect(x:50, y: 300, width: 320.00, height: 50.00));
        self.view.addSubview(emailText!)
        
       // passwordText!.center = self.view.center
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
        

        
        //this passwordText for this VC
        confirmPassword = UITextField(frame: CGRect(x:50, y: 500, width: 320.00, height: 50.00));
        self.view.addSubview(confirmPassword!)
        
       // passwordText!.center = self.view.center
        confirmPassword!.placeholder = "Password"
        
        confirmPassword?.borderStyle = UITextField.BorderStyle.line
        
        confirmPassword!.backgroundColor = UIColor.white
        
        
        
        //this the sign Up Button
        signupBtn = UIButton()
        signupBtn?.setBackgroundImage(UIImage(named: "Signup"), for: .normal)
        signupBtn?.imageView?.contentMode = .scaleAspectFill
        self.view.addSubview(signupBtn!)
        signupBtn?.translatesAutoresizingMaskIntoConstraints = false
        signupBtn?.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
        signupBtn?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier : 1.0).isActive = true
        signupBtn?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier : 0.2).isActive = true
        signupBtn?.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier : 0.7).isActive = true
        signupBtn?.addTarget(self, action: #selector(SignupVC.signUpBtnPressed), for: UIControl.Event.touchUpInside)
        
        
        
    }

    @objc func signUpBtnPressed(sender: UIButton!)
    {
        
        //If fields are left blank do not let the user continue
        if (passwordText!.text == "" || emailText!.text == "" || nameText!.text == ""){
            //Update error text with message
            errorText!.text = "Fields cannot be left blank"
            //Show error text
            errorText!.isHidden = false
        }
        else if (confirmPassword!.text != passwordText!.text){
            errorText!.text = "Passwords do not match"
            errorText!.isHidden = false
        }
        else{
            Auth.auth().createUser( withEmail: emailText!.text!, password: passwordText!.text!) { user, error in
                if error == nil {
                    Auth.auth().signIn(withEmail: self.emailText!.text!, password: self.passwordText!.text!)
                }
            }
        }
        
       
        let GoalVC = GoalVC()
        navigationController?.pushViewController(GoalVC , animated: true)
        return;
    
    }
    
    
    func displayMyAlertMessage(userMessage:String)
    {
     
        
        let myAlert = UIAlertController(title: "Alert", message:userMessage, preferredStyle: UIAlertController.Style.alert);
        
    let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:nil);
        
    myAlert.addAction(okAction);

        self.present(myAlert, animated: true, completion:nil);
        
    }
    
}
