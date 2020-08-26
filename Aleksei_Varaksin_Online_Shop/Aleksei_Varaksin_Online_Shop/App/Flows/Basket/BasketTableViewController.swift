//
//  BasketTableViewController.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 16.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import UIKit

class BasketTableViewController: UITableViewController {

    let getUsersBasketService = NetworkServiceFactory().makeGetUsersBasketService()
    let removeItemFromBasketService = NetworkServiceFactory().makeRemoveItemFromBasketService()
    private var itemsInBasket: [ItemInBasket] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getUsersBasketService.getUsersBasket(userID: 1) { [weak self] response in
          guard let itemsInBasketList = response?.products else { return }
          self?.itemsInBasket = itemsInBasketList
          self?.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInBasket.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell") as? BasketTableViewCell else {
          return UITableViewCell()
        }
        cell.configure(with: itemsInBasket[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeItemFromBasketService.removeItemFromBasket(productID: itemsInBasket[indexPath.row].productID) { [weak self] response in
                self?.showItemFromBasketWasRemoved()
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            itemsInBasket.remove(at: indexPath.row)
        }
    }

    private func showItemFromBasketWasRemoved() {
      let alertController = UIAlertController(title: "Success",
                                              message: "Item was removed",
                                              preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] action in
        self?.navigationController?.popViewController(animated: true)
      }
      alertController.addAction(okAction)
      present(alertController, animated: true, completion: nil)
    }
}
