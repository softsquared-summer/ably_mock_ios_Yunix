//
//  FirstOptionViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import PMSuperButton

class FirstOptionViewController: UIViewController {

    @IBOutlet var optionButton: PMSuperButton!
    @IBOutlet var tableView: UITableView!
    
    var rootViewController: ProductOptionViewController!
    var data: [ProductOptionResponseResult]!
    var firstOptionList: [String]!
    var optionDictionary: [String : [String]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        
        let selectedProductNib = UINib(nibName: SelectedProductTableViewCell.identifier, bundle: nil)
        tableView.register(selectedProductNib, forCellReuseIdentifier: SelectedProductTableViewCell.identifier)
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }

    @IBAction func pressedFirstOption(_ sender: Any) {
        let nextViewController = SelectedFirstOptionViewController()
        nextViewController.receiveData(rootViewController: self.rootViewController, result: data, firstOptionList: firstOptionList, optionDictionary: optionDictionary)
        
        rootViewController.addChild(nextViewController)
        nextViewController.view.frame = rootViewController.contentView.bounds
        rootViewController.scrollView.contentSize = nextViewController.view.frame.size
        rootViewController.scrollView.addSubview(nextViewController.view)
        view.removeFromSuperview()
        removeFromParent()
    }
    
    func receiveData(rootViewController: ProductOptionViewController, result: [ProductOptionResponseResult], firstOptionList: [String]!, optionDictionary: [String : [String]]!) {
        self.rootViewController = rootViewController
        self.data = result
        self.firstOptionList = firstOptionList
        self.optionDictionary = optionDictionary
    }
    
    func selectedSecondOption(rootViewController: ProductOptionViewController, result: [ProductOptionResponseResult], firstOptionList: [String]!, optionDictionary: [String : [String]]!, firstOption: String!, secondOption: String!, price: Int!) {
        self.rootViewController = rootViewController
       self.data = result
       self.firstOptionList = firstOptionList
       self.optionDictionary = optionDictionary
        
        var isOverlap = false
        
        if rootViewController.itemList == [:] {
            rootViewController.priceView.isHidden = false
            rootViewController.itemList[rootViewController.itemList.count] = [firstOption, secondOption, String(price), "1"]
            let totalCount = Int(rootViewController.itemCount.text!)!
            rootViewController.itemCount.text = String(totalCount + 1)
            let intPrice = rootViewController.itemPrice.text!.components(separatedBy: ["원"]).joined()
            let totalPrice = Int(intPrice)!
            rootViewController.itemPrice.text = String(totalPrice + price) + "원"
        } else {
            for i in rootViewController.itemList {
                if i.value.contains(firstOption) && i.value.contains(secondOption) {
                    isOverlap = true
                    break
                }
            }
            if isOverlap {
                let alert = UIAlertController(title: "같은 품목은 선택할 수 없습니다.", message: nil, preferredStyle: .alert)
                let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
                
                alert.addAction(actionOkay)

                rootViewController.present(alert, animated: true, completion: nil)
            } else {
                rootViewController.priceView.isHidden = false
                rootViewController.itemList[rootViewController.itemList.count] = [firstOption, secondOption, String(price), "1"]
                let totalCount = Int(rootViewController.itemCount.text!)!
                rootViewController.itemCount.text = String(totalCount + 1)
                let intPrice = rootViewController.itemPrice.text!.components(separatedBy: ["원"]).joined()
                let totalPrice = Int(intPrice)!
                rootViewController.itemPrice.text = String(totalPrice + price) + "원"
            }
        }
        
       
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

extension FirstOptionViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rootViewController.itemList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectedProductTableViewCell.identifier, for: indexPath) as? SelectedProductTableViewCell else {
            return UITableViewCell()
        }
        
        cell.updateUI(rootViewController.itemList[indexPath.row]!, indexPath.row, self, rootViewController, indexPath)
        
        return cell
    }
    
    
    
}
