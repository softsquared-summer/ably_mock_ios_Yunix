//
//  SelectedProductTableViewCell.swift
//  ios
//
//  Created by 이한길 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SelectedProductTableViewCell: UITableViewCell {

    
    
    @IBOutlet var firstOptionLabel: UILabel!
    @IBOutlet var secondOptionLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    static let identifier: String = "SelectedProductTableViewCell"
    
    var rootViewController: ProductOptionViewController!
    var mainViewController: FirstOptionViewController!
    var index: Int!
    var result: [String]!
    var indexPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pressedMinusButton(_ sender: Any) {
        var count = Int(countLabel.text!)!
        if count > 1 {
            count -= 1
            countLabel.text = String(count)
            rootViewController.itemList[index]![3] = String(count)
            let price = Int(result[2])!
            priceLabel.text = "\(count * price)".insertComma + "원"
            let totalCount = Int(rootViewController.itemCount.text!)!
            rootViewController.itemCount.text = String(totalCount - 1)
            let intPrice = rootViewController.itemPrice.text!.components(separatedBy: ["원", ","]).joined()
            let totalPrice = Int(intPrice)!
            rootViewController.itemPrice.text = String(totalPrice - price).insertComma + "원"
            mainViewController.tableView.reloadData()
        }
    }
    
    @IBAction func pressedPlusButton(_ sender: Any) {
        var count = Int(countLabel.text!)!
        if count < 100 {
            count += 1
            countLabel.text = String(count)
            rootViewController.itemList[index]![3] = String(count)
            let price = Int(result[2])!
            priceLabel.text = "\(count * price)".insertComma + "원"
            let totalCount = Int(rootViewController.itemCount.text!)!
            rootViewController.itemCount.text = String(totalCount + 1)
            let intPrice = rootViewController.itemPrice.text!.components(separatedBy: ["원", ","]).joined()
            let totalPrice = Int(intPrice)!
            rootViewController.itemPrice.text = String(totalPrice + price).insertComma + "원"
            mainViewController.tableView.reloadData()
        }
    }
    
    @IBAction func pressedCancel(_ sender: Any) {
        let count = Int(countLabel.text!)!
        let price = Int(result[2])! * count
        let totalCount = Int(rootViewController.itemCount.text!)!
        rootViewController.itemCount.text = String(totalCount - count)
        let intPrice = rootViewController.itemPrice.text!.components(separatedBy: ["원", ","]).joined()
        let totalPrice = Int(intPrice)!
        rootViewController.itemPrice.text = String(totalPrice - price).insertComma + "원"
        rootViewController.itemList.removeValue(forKey: index)
        
        if rootViewController.itemList.count == 0 {
            rootViewController.priceView.isHidden = true
        } else {
            var newItemList: [Int : [String]] = [:]
            var i = 0
            var j = 0
            while i <= rootViewController.itemList.count {
                if (i == self.index) {
                    i += 1
                    continue
                }
                newItemList[j] = rootViewController.itemList[i]
                i += 1
                j += 1
            }
            rootViewController.itemList = newItemList
        }
        mainViewController.tableView.deleteRows(at: [indexPath], with: .none)
        mainViewController.tableView.reloadData()
    }
    
    func updateUI(_ result: [String], _ index: Int, _ mainViewController: FirstOptionViewController, _ rootViewController: ProductOptionViewController, _ indexPath: IndexPath) {
        self.index = index
        firstOptionLabel.text = result[0]
        secondOptionLabel.text = result[1]
        countLabel.text = result[3]
        let count = Int(result[3])
        let price = Int(result[2])
        priceLabel.text = "\(count! * price!)".insertComma + "원"
        self.mainViewController = mainViewController
        self.rootViewController = rootViewController
        self.result = result
        self.indexPath = indexPath
    }
}
