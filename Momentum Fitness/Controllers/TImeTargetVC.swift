//
//  TImeTargetVC.swift
//  Momentum Fitness
//
//  Created by  on 2021-11-27.
//

import UIKit

class TImeTargetVC: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var startButton: UIButton!
    var name = ""
    var timer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nameLabel.text = name
        textName.text = timer
     
    }
    
    
    @IBAction func didTapped(sender: UIButton)
     {
        performSegue(withIdentifier: "vc2", sender: nil)
     }
     
     
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
         if segue.identifier == "vc2",
            let anotherViewController = segue.destination as? TImerVC{
             anotherViewController.seconds = Int(timer)!
            
         }
     }
    
    
    
    

}
