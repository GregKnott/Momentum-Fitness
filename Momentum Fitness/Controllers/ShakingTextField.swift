//
//  ShakingTextField.swift
//  Momentum Fitness
//
//  Created by TROY johnson on 2021-12-08.
//

import UIKit

class ShakingTextField: UITextField {
        
    func shake()
    {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.06
        animation.repeatCount = 6
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }

    }


