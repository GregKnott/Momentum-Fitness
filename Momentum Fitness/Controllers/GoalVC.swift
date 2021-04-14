//
//  GoalVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit
import DLRadioButton

class GoalVC: UIViewController {

    //A variable to store the users last selection
    //This will be put in core storage
    var goal: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adds the logo to the top center, as well as removing text from back button, needs to be on every VC
        styleTopBar(nav: navigationItem)
    }
    
    @IBAction func loseWeightRB(_ sender: DLRadioButton) {
        goal = "Lose weight"
    }
    
    @IBAction func maintainWeightRB(_ sender: DLRadioButton) {
        goal = "Maintain weight"
    }
    
    @IBAction func gainWeightRB(_ sender: DLRadioButton) {
        goal = "Gain weight"
    }

}
