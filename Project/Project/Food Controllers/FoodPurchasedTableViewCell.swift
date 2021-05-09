//
//  FoodPurchasedTableViewCell.swift
//  Project
//
//  Created by Ramy Hanafi on 3/17/21.
//

import UIKit

class FoodPurchasedTableViewCell: UITableViewCell {
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
