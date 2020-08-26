//
//  ShopTableViewCell.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 16.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import UIKit

class ShopTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!

    func configure(with item: Item) {
      nameLabel.text = item.productName
     priceLabel.text = "$\(item.price)"
    }

    override func prepareForReuse() {
      super.prepareForReuse()
      nameLabel.text = ""
      priceLabel.text = ""
      selectionStyle = .none
    }
}
