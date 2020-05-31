//
//  SelectedFirstOptionViewController.swift
//  ios
//
//  Created by 이한길 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SelectedFirstOptionViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var data: [ProductOptionResponseResult]!
    var firstOptionList: [String]!
    var optionDictionary: [String : [String]]!
    var rootViewController: ProductOptionViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        let firstOptionNib = UINib(nibName: FirstOptionTableViewCell.identifier, bundle: nil)
        tableView.register(firstOptionNib, forCellReuseIdentifier: FirstOptionTableViewCell.identifier)
    }

    func receiveData(rootViewController: ProductOptionViewController, result: [ProductOptionResponseResult], firstOptionList: [String]!, optionDictionary: [String : [String]]!) {
        self.rootViewController = rootViewController
        self.data = result
        self.firstOptionList = firstOptionList
        self.optionDictionary = optionDictionary
    }
    
    func selectedOption(select: String!, index: Int!) {
        let secondOptionList = optionDictionary[select]
        
        let nextViewController = SelectedSecondOptionViewController()
        nextViewController.receiveData(rootViewController: self.rootViewController, result: data, firstOptionList: firstOptionList, optionDictionary: optionDictionary, secondOptionList: secondOptionList, cellIndex: index)
        
        rootViewController.addChild(nextViewController)
        nextViewController.view.frame = rootViewController.contentView.bounds
        rootViewController.scrollView.contentSize = nextViewController.view.frame.size
        rootViewController.scrollView.addSubview(nextViewController.view)
        removeFromParent()
        view.removeFromSuperview()
    }
    
    @IBAction func pressedFirstOption(_ sender: Any) {
        let nextViewController = FirstOptionViewController()
        nextViewController.receiveData(rootViewController: self.rootViewController, result: data, firstOptionList: firstOptionList, optionDictionary: optionDictionary)
        
        rootViewController.addChild(nextViewController)
        nextViewController.view.frame = rootViewController.contentView.bounds
        rootViewController.scrollView.contentSize = nextViewController.view.frame.size
        rootViewController.scrollView.addSubview(nextViewController.view)
        removeFromParent()
        view.removeFromSuperview()
        
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

extension SelectedFirstOptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstOptionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstOptionTableViewCell.identifier, for: indexPath) as? FirstOptionTableViewCell else {
                    return UITableViewCell()
                }
        
        cell.tableView = self
        cell.updateUI(firstOptionList[indexPath.row], indexPath.row)
                
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedOption(select: firstOptionList[indexPath.row], index: indexPath.row)
    }
}
