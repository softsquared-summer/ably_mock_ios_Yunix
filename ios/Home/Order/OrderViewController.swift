//
//  OrderViewController.swift
//  ios
//
//  Created by 이한길 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Alamofire

class OrderViewController: UIViewController {

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var accountLabel: UILabel!
    @IBOutlet var totalPriceLabel: UILabel!
    @IBOutlet var inputLocationLabel: UILabel!
    @IBOutlet var inputAccountLabel: UILabel!
    @IBOutlet var totalCountLabel: UILabel!
    
    var locationViewController: LocationViewController!
    var accountViewController: AccountViewController!
    
    var locationData: [String]!
    var accountData: [String]!
    
    var itemData: [Int: [String]]!
    var price: String!
    var count: String!
    var result: [ProductOptionResponseResult]!
    var productInfo: [[String : Int]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalPriceLabel.text = price
        totalCountLabel.text = count
        
        locationViewController = LocationViewController()
        accountViewController = AccountViewController()
        
        locationViewController.rootViewController = self
        accountViewController.rootViewController = self
    }
    
    func doneItem(data: [Int : [String]]!, price: String!, count: String!, result: [ProductOptionResponseResult]!, index: Int!) {
        itemData = data
        self.price = price
        self.count = count
        self.result = result
        
        for i in result {
            for j in data {
                if (i.firstOption == j.value[0]) && (i.secondOption == j.value[1]) {
                    let countInt = Int(j.value[3])
                    productInfo.append(["detailedProductIdx" : i.detailedProductIdx, "number" : countInt!])
                    break
                }
            }
        }
        
        
        // rootViewController.itemList[rootViewController.itemList.count] = [firstOption, secondOption, String(price), "1"]
        
    }
    
    func doneLoctaion(data: [String]!) {
        locationData = data
        
        locationLabel.textColor = .black
        locationLabel.text = "\(data[0]) \(data[4])\n\(data[2])\n\(data[3])"
        inputLocationLabel.text = "변경하기"
    }
    
    func doneAccount(data: [String]!) {
        accountData = data
        
        accountLabel.textColor = .black
        accountLabel.text = "\(data[1]) | \(data[0]) \(data[2])"
        inputAccountLabel.text = "변경하기"
    }
    
    func successOrders(result: String!) {
        let alert = UIAlertController(title: "주문 성공", message: "주문 번호 : " + result, preferredStyle: .alert)
        let actionOkay = UIAlertAction(title: "확인", style: .default) { (action) in
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        alert.addAction(actionOkay)

        present(alert, animated: true, completion: nil)
    }

    @IBAction func pressedPurchaseButton(_ sender: Any) {
        let parameters: Parameters = Parameters(dictionaryLiteral: ("productInfo", self.productInfo),
        ("paymentType", "CARD"),
        ("refundBank", self.accountData[0]),
        ("refundOwner", self.accountData[1]),
        ("refundAccount", self.accountData[2]),
        ("receiver", self.locationData[0]),
        ("postalCode", self.locationData[1]),
        ("address", self.locationData[2]),
        ("detailedAddress", self.locationData[3]),
        ("phone", self.locationData[4]),
        ("message", ""))

        let headers: HTTPHeaders = ["x-access-token" : userToken!]

        OrderDataManager().postOrders(self, headers, parameters)
        
    }
    
    @IBAction func pressedLocationButton(_ sender: Any) {
        self.navigationController?.pushViewController(locationViewController, animated: true)
    }
    
    @IBAction func pressedAccountButton(_ sender: Any) {
        self.navigationController?.pushViewController(accountViewController, animated: true)
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
