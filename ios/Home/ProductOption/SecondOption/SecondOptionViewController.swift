//
//  SecondOptionViewController.swift
//  ios
//
//  Created by 이한길 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SecondOptionViewController: UIViewController {

    @IBOutlet var firstOptionLabel: UILabel!
    
    var data: [ProductOptionResponseResult]!
    var firstOptionList: [String]!
    var optionDictionary: [String : [String]]!
    var rootViewController: ProductOptionViewController!
    var secondOptionList: [String]!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstOptionLabel.text = firstOptionList[index]
        // Do any additional setup after loading the view.
    }

    func receiveData(rootViewController: ProductOptionViewController, result: [ProductOptionResponseResult], firstOptionList: [String]!, optionDictionary: [String : [String]]!, secondOptionList: [String]! = [], cellIndex: Int! = 0) {
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
        let nextViewController = SelectedSecondOptionViewController()
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
