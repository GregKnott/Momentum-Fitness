//
//  WorkoutTableViewCell.swift
//  Momentum Fitness
//
//  Created by  on 4/16/21.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    
    var workout: Workout? {
        didSet {
            guard let workout = workout else {return}
            self.addSubview(nameLabel)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
            nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 1.0).isActive = true
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0.5)
            
            nameLabel.text = workout.name
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
