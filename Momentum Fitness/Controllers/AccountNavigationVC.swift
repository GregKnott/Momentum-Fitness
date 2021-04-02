//
//  AccountNavigationVC.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit

class AccountNavigationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Adds the logo to the top center, needs to be on every VC
        navigationItem.titleView = UIImageView(image: UIImage(named: "logoSmall"))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
