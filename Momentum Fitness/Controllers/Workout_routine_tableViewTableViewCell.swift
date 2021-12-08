//
//  Workout_routine_tableViewTableViewCell.swift
//  Momentum Fitness
//
//  Created by TROY johnson on 2021-12-01.
//

import UIKit

class Workout_routine_tableViewTableViewCell: UITableViewCell {
    
    @IBOutlet var workoutImage: UIImageView!
    @IBOutlet var workoutRoutine: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
