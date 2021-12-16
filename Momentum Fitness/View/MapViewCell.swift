//
//  MapViewCell.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-12-15.
//

import UIKit

class MapViewCell: UITableViewCell {

    @IBOutlet var mapItemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
