//
//  ViewController.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-04-02.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let navBar = self.navigationController?.navigationBar
        
        // Transparent navigation bar
        navBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
        
//        navBar?.topItem?.titleView = UIImageView(image: UIImage(named: "logoSmall"))
        
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backBarButton.tintColor = UIColor(ciColor: .white)
        navigationItem.backBarButtonItem = backBarButton
        
        navigationItem.titleView?.contentMode = .scaleAspectFit
    }


}

