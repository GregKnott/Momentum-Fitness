//
//  ActivityTableViewCell.swift
//  Momentum Fitness
//
//  Created by  on 4/16/21.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
        
        //Create blank UILabels to be added programatically
        var nameLabel = UILabel()
        var repsLabel = UILabel()
        var weightLabel = UILabel()
        
        var activity: ActivityObject? {
            didSet {
                guard let activity = activity else {return}
                
                //Apply formatting on label format
                self.addSubview(nameLabel)
                nameLabel.translatesAutoresizingMaskIntoConstraints = false
                nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
                nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
                nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 1.0).isActive = true
                nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0.5)
                
                self.addSubview(repsLabel)
                repsLabel.translatesAutoresizingMaskIntoConstraints = false
                repsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
                repsLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
                repsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 1.0).isActive = true
                repsLabel.rightAnchor.constraint(equalToSystemSpacingAfter: nameLabel.rightAnchor, multiplier: 25.5).isActive = true
                
                self.addSubview(weightLabel)
                weightLabel.translatesAutoresizingMaskIntoConstraints = false
                weightLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
                weightLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
                weightLabel.topAnchor.constraint(equalTo: topAnchor, constant: 1.0).isActive = true
                weightLabel.rightAnchor.constraint(equalToSystemSpacingAfter: repsLabel.rightAnchor, multiplier: 25.5).isActive = true
                
                //Assign the labels their respective values
                nameLabel.text = activity.name
                repsLabel.text = activity.reps
                weightLabel.text = activity.weight
                
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
