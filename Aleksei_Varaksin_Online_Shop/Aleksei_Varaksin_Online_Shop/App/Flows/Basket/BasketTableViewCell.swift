//
//  BasketTableViewCell.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 16.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var totalPriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
