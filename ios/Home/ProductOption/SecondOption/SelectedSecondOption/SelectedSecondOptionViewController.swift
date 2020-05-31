//
//  SelectedSecondOptionViewController.swift
//  ios
//
//  Created by 이한길 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SelectedSecondOptionViewController: UIViewController {

    @IBOutlet var firstOptionLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var data: [ProductOptionResponseResult]!
    var firstOptionList: [String]!
    var optionDictionary: [String : [String]]!
    var rootViewController: ProductOptionViewController!
    var secondOptionList: [String]!
    var index: Int!
    var price: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstOptionLabel.text = firstOptionList[index]

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        let firstOptionNib = UINib(nibName: SecondOptionTableViewCell.identifier, bundle: nil)
        tableView.register(firstOptionNib, forCellReuseIdentifier: SecondOptionTableViewCell.identifier)
    }

    func receiveData(rootViewController: ProductOptionViewController, result: [ProductOptionResponseResult], firstOptionList: [String]!, optionDictionary: [String : [String]]!, secondOptionList: [String]!, cellIndex: Int!) {
        self.rootViewController = rootViewController
        self.data = result
        self.firstOptionList = firstOptionList
        self.optionDictionary = optionDictionary
        self.secondOptionList = secondOptionList
        self.index = cellIndex
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
    
    @IBAction func pressedSecondOption(_ sender: Any) {
        let nextViewController = SecondOptionViewController()
        nextViewController.receiveData(rootViewController: self.rootViewController, result: data, firstOptionList: firstOptionList, optionDictionary: optionDictionary, secondOptionList: self.secondOptionList, cellIndex: self.index)
        
        rootViewController.addChild(nextViewController)
        nextViewController.view.frame = rootViewController.contentView.bounds
        rootViewController.scrollView.contentSize = nextViewController.view.frame.size
        rootViewController.scrollView.addSubview(nextViewController.view)
        view.removeFromSuperview()
        removeFromParent()
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

extension SelectedSecondOptionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondOptionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SecondOptionTableViewCell.identifier, for: indexPath) as? SecondOptionTableViewCell else {
                    return UITableViewCell()
        }
        
        cell.updateUI(secondOption: secondOptionList[indexPath.row], price: data[indexPath.row].detailedPrice)
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = FirstOptionViewController()
        nextViewController.selectedSecondOption(rootViewController: self.rootViewController, result: data, firstOptionList: firstOptionList, optionDictionary: optionDictionary, firstOption: firstOptionLabel.text, secondOption: secondOptionList[indexPath.row], price: data[indexPath.row].detailedPrice)
        
        rootViewController.addChild(nextViewController)
        nextViewController.view.frame = rootViewController.contentView.bounds
        rootViewController.scrollView.contentSize = nextViewController.view.frame.size
        rootViewController.scrollView.addSubview(nextViewController.view)
        view.removeFromSuperview()
        removeFromParent()
        
        
    }
}
