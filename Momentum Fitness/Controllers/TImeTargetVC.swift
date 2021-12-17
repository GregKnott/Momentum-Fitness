//
//  TImeTargetVC.swift
//  Momentum Fitness
//
//  Created by  on 2021-11-27.
//

import UIKit

class TImeTargetVC: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nameLabel.text = name
     
    }
    
    
    
    

}
