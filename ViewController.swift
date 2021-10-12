//
//  ViewController.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit

//Global function to set the style of the top bar
func styleTopBar(nav: UINavigationItem){
    
    //Set back bar button to have no title
    nav.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    //Set title bar button to the logo
    nav.titleView = UIImageView(image: UIImage(named: "logoSmall"))
}

class ViewController: UIViewController {
    
    var cont: UIButton?
    var homeImage: UIImageView?
    var logoImage: UIImageView?
    var text1: UITextField?
    var text2: UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //this the logo image for the Home Screen
        
        
        logoImage  = UIImageView(image: UIImage(named: "logo"))
        view.addSubview(logoImage!)
        
        logoImage!.translatesAutoresizingMaskIntoConstraints = false
        
        logoImage?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.20).isActive = true
        logoImage?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.10).isActive = true
        logoImage?.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor,  multiplier: 0.33).isActive = true
        logoImage?.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        
        
        //This is the constraint for the Text field
        
        text1  = UITextField()
        view.addSubview(text1!)
        text1!.text = "Momentum"
        text1!.font = UIFont(name: "Avenir", size: 22)
        text1!.font = UIFont.boldSystemFont(ofSize: 30)
        text1!.textColor = UIColor.white
        text1!.translatesAutoresizingMaskIntoConstraints = false
        text1?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.80).isActive = true
        text1?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0).isActive = true
        text1?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,  constant:80).isActive = true
        text1?.topAnchor.constraint(equalTo: view.topAnchor, constant: 210).isActive = true
        
        
        text2  = UITextField()
        view.addSubview(text2!)
        text2!.text = "Revamp your workout"
        text2!.font = UIFont.boldSystemFont(ofSize: 20)
        text2!.translatesAutoresizingMaskIntoConstraints = false
        text2?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.80).isActive = true
        text2?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0).isActive = true
        text2?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,  constant:80).isActive = true
        text2?.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        
    
        //this is image  view for constraint
        
        homeImage  = UIImageView(image: UIImage(named: "splashSilhouette"))
        view.addSubview(homeImage!)
        homeImage!.translatesAutoresizingMaskIntoConstraints = false
        homeImage?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.50).isActive = true
        homeImage?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.16).isActive = true
        homeImage?.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor,  multiplier: 0.33).isActive = true
        homeImage?.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        
    
        
        //this the Continue Button
        cont = UIButton()
        cont?.setBackgroundImage(UIImage(named: "Continue"), for: .normal)
        cont?.imageView?.contentMode = .scaleAspectFill
        self.view.addSubview(cont!)
        cont?.translatesAutoresizingMaskIntoConstraints = false
        cont?.topAnchor.constraint(equalTo: view.topAnchor, constant: 700).isActive = true
        cont?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier : 1.0).isActive = true
        cont?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier : 0.2).isActive = true
        cont?.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier : 0.5).isActive = true
        cont?.addTarget(self, action: #selector(ViewController.upBtnPressed), for: UIControl.Event.touchUpInside)
        
        
        
        let navBar = self.navigationController?.navigationBar
        
        // Transparent navigation bar - global changes
        navBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
        navBar?.tintColor = UIColor(ciColor: .white)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    @objc func upBtnPressed(sender: UIButton!)
    {
        let secondaryController = AccountNavigationVC()
        navigationController?.pushViewController(secondaryController, animated: true)
    }


}

