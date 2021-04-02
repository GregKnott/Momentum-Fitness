//
//  ViewController.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit

//global function to set the style of the top bar
func styleTopBar(nav: UINavigationItem){
    
    //set back bar button to have no title
    nav.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    //set title bar button to the logo
    nav.titleView = UIImageView(image: UIImage(named: "logoSmall"))
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let navBar = self.navigationController?.navigationBar
        
        // Transparent navigation bar - global changes
        navBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
        navBar?.tintColor = UIColor(ciColor: .white)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }


}

