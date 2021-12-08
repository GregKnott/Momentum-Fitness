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

    @IBOutlet var signInButton : UIButton?
    
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
        self.view.backgroundColor = UIColor.init(named: "Theme")
        
        
        
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
        
        //Set textbox to not autocorrect since it is an email
        emailText?.autocorrectionType = .no
        //Set textbox to not auto capitalize since it is an email
        emailText?.autocapitalizationType = .none
        
        emailText?.borderStyle = UITextField.BorderStyle.line
        
        emailText!.backgroundColor = UIColor.white
        emailText!.textColor = .black
        
        
        
        
        //this passwordText for this VC
        passwordText = UITextField(frame: CGRect(x:50, y: 400, width: 320.00, height: 50.00));
        self.view.addSubview(passwordText!)
        
       // passwordText!.center = self.view.center
        passwordText!.placeholder = "Password"
        
        //Set textbox to treat textbx as user creating new password
        passwordText?.textContentType = .newPassword
        //Set textbox to hide entered characters
        passwordText?.isSecureTextEntry = true
        
        //Set textbox to not autocorrect since it is a password
        passwordText?.autocorrectionType = .no
        //Set textbox to not auto capitalize since it is a password
        passwordText?.autocapitalizationType = .none
        
        passwordText?.borderStyle = UITextField.BorderStyle.line
        
        passwordText!.backgroundColor = UIColor.white
        passwordText!.textColor = .black
    
        
        signInButton = UIButton()
        signInButton?.setBackgroundImage(UIImage(named: "Signin"), for: .normal)
        signInButton?.imageView?.contentMode = .scaleAspectFill
        self.view.addSubview(signInButton!)
        signInButton?.translatesAutoresizingMaskIntoConstraints = false
        signInButton?.topAnchor.constraint(equalTo: view.topAnchor, constant:500).isActive = true
        signInButton?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier : 1.0).isActive = true
        signInButton?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier : 0.2).isActive = true
        signInButton?.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier : 0.5).isActive = true
        signInButton?.addTarget(self, action: #selector(SignInVC.signInBtnPressed), for: UIControl.Event.touchUpInside)
    }
    
    
    @objc func signInBtnPressed(sender: UIButton!)
    {
      validateFields()
    
    }
        
    
    func validateFields(){
        if emailText!.text?.isEmpty == true
        {
            displayMyAlertMessage(userMessage: "Fields cant be blank");
           return;
        }
            
        if passwordText!.text?.isEmpty == true
            {
            displayMyAlertMessage(userMessage: "Fields cant be blank");
           return;
        }
        login()
    }
         
         
    func login(){
             //perform a login with this information
             Auth.auth().signIn(withEmail: emailText!.text!, password: passwordText!.text!) { (user, error) in
                
                 if error == nil {
                     
                     
                     
                  //  self.performSegue(withIdentifier: "enable", sender: self)
                    
                     let storyboard = UIStoryboard(name: "Main", bundle: nil)
                     let mainTabBarController = storyboard.instantiateViewController(withIdentifier: "signIn")
                     
                     self.navigationController?.pushViewController(mainTabBarController, animated:true)
                     
                     self.displayMyAlertMessage(userMessage: "You have logged in successful");
                 
                 }
                 
                 else{
                     let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                     let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                     
                     alertController.addAction(defaultAction)
                     self.present(alertController, animated: true, completion: nil)
                 }
             }
         }
    
            
    
    func checkUserInfo()
        {
            if Auth.auth().currentUser != nil {
                print(Auth.auth().currentUser?.uid)
                let storyboard = UIStoryboard(name: "TabBarController", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
                vc.modalPresentationStyle = .overFullScreen
                present(vc, animated: true)
            }
            
        }
    
    
    
    
   /** @IBAction func FBLogin(_ sender: Any) {
        //  user = CoredDataHandler.fetchObject()
          if let token = AccessToken.current,
             !token.isExpired{
              let token = token.tokenString
              
              let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                       parameters: ["fields": "email,name"],
                                                       tokenString: token,
                                                       version: nil,
                                                       httpMethod: .get)
              
              request.start(completion: {connection, result, error in
                  print("\(result)")
              })
              
          }
          else{
          let loginButton = FBLoginButton()
                  loginButton.center = view.center
                 loginButton.delegate = self
              loginButton.permissions = ["public_profile", "email"]
                  view.addSubview(loginButton)
      }
      }
      
      
     func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
          let token = result?.token?.tokenString
          
          let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                   parameters: ["fields": "email,name"],
                                                   tokenString: token,
                                                   version: nil,
                                                   httpMethod: .get)
          
          request.start(completion: {connection, result, error in
              print("\(result)")
             
          })
          checkUserInfo()
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }*/
    
    
    
    

    
    func displayMyAlertMessage(userMessage:String)
    {
     
        
        let myAlert = UIAlertController(title: "Alert", message:userMessage, preferredStyle: UIAlertController.Style.alert);
        
    let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:nil);
        
    myAlert.addAction(okAction);

        self.present(myAlert, animated: true, completion:nil);
        
    }
    
}

