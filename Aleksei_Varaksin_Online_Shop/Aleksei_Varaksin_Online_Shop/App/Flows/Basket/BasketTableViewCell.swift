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

    func configure(with itemInBasket: ItemInBasket) {
        nameLabel.text = itemInBasket.productName
        totalPriceLabel.text = "$\(itemInBasket.price * itemInBasket.quantity)"
        countLabel.text = "\(itemInBasket.quantity)"
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
        totalPriceLabel.text = ""
        countLabel.text = ""
        selectionStyle = .none
    }
}
