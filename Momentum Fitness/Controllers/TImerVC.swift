//
//  TImerVC.swift
//  Momentum Fitness
//
//  Created by  on 2021-11-27.
//

import UIKit

class TImerVC: UIViewController {

 
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    var seconds = 60
    var isTimerRunning = false
    var resumeTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func startButtonClick(_ sender: Any) {
        
        if isTimerRunning == false{
            runTimer()
        }
    }
    
    
    @IBAction func completeButtonClick(_ sender: UIButton) {
     if  seconds < 30
        {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let viewController = storyboard.instantiateViewController(withIdentifier: "greatJob")
         
         self.navigationController?.pushViewController(viewController, animated:true)
     }
        else
        {
            self.displayMyAlertMessage(userMessage: "Cannot complete workout in less than half the time");
            return;
    }
    }
    
    
    
    func runTimer()
    {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TImerVC.timerClass), userInfo: nil, repeats: true)
        
        isTimerRunning = true
    }
    

    @IBAction func stopButtonClick(_ sender: Any) {
        timer.invalidate()
        seconds = 60
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isTimerRunning = false
    }
    
    
    @objc func timerClass()
    {
        if seconds < 1
        {
            timer.invalidate()
        }
        else{
        seconds -= 1
        timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)    }
    
    
    
    func displayMyAlertMessage(userMessage:String)
    {
     
        
        let myAlert = UIAlertController(title: "Alert", message:userMessage, preferredStyle: UIAlertController.Style.alert);
        
    let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:nil);
        
    myAlert.addAction(okAction);

        self.present(myAlert, animated: true, completion:nil);
        
    }
    

}


