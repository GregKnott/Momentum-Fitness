//
//  GreatJobVC.swift
//  Momentum Fitness
//
//  Created by  on 4/2/21.
//

import UIKit

class GreatJobVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
}
