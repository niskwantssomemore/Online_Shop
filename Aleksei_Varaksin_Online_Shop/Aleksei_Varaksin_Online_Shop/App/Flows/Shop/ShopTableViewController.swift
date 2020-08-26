//
//  ShopTableViewController.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 16.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import UIKit

class ShopTableViewController: UITableViewController {

    private let getItemListService = NetworkServiceFactory().makeGetItemsListService()
    private var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getItemListService.getItemsList(categoryID: 1) { [weak self] response in
          guard let itemsList = response?.products else { return }
          self?.items = itemsList
          self?.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTableViewCell") as? ShopTableViewCell else {
          return UITableViewCell()
        }
        cell.configure(with: items[indexPath.row])
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
