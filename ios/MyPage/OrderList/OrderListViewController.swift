//
//  OrderListViewController.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class OrderListViewController: UIViewController {

    @IBOutlet var shippingLabel: UILabel!
    @IBOutlet var shippedLabel: UILabel!
    @IBOutlet var cancelLabel: UILabel!
    
    @IBOutlet var tableView: UITableView!
    
    var data: OrderListResponseResult!
    
    var dataList: [OrderListResponseProductInfo] = []
    var dateData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: OrderListTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: OrderListTableViewCell.identifier)
        // Do any additional setup after loading the view.
        OrderListDataManager().getOrders(orderListViewController: self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }

    func receiveData(data: OrderListResponseResult) {
        self.data = data
        shippedLabel.text = String(data.shippingCnt)
        shippedLabel.text = String(data.shippedCnt)
        cancelLabel.text = String(data.cancelCnt)
        tableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data == nil {
            return 0
        } else {
            for i in data.orderInfo {
                for j in i.productInfo {
                    dateData.append(i.orderDate)
                    dataList.append(j)
                }
            }
            return dataList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTableViewCell.identifier, for: indexPath) as? OrderListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.updateUI(data: dataList[indexPath.row], date: dateData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}
