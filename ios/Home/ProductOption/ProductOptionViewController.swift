//
//  ProductOptionViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import SnapKit
import PMSuperButton

class ProductOptionViewController: UIViewController {
    
    @IBOutlet var contentView: UIView!
    
    var itemList: [Int : [String]] = [:] 
    var currentIndex: Int!
    var scrollView: UIScrollView!
    var contentInputView = FirstOptionViewController()
    @IBOutlet var itemCount: UILabel!
    @IBOutlet var itemPrice: UILabel!
    @IBOutlet var priceView: PMSuperButton!
    var rootViewController: ProductInfoViewController!
    var result: [ProductOptionResponseResult]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProductOptionDataManager().getProductOption(self, currentIndex)
        // Do any additional setup after loading the view.
        itemCount.text = "0"
        itemPrice.text = "0원"
        contentInputView.rootViewController = self
        addChild(contentInputView)
        contentInputView.view.frame = contentView.bounds
        scrollView = UIScrollView(frame: contentView.bounds)
        scrollView.isScrollEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = contentInputView.view.frame.size
        scrollView.addSubview(contentInputView.view)
        contentView.addSubview(scrollView)
        priceView.layer.zPosition = 1000
        priceView.isHidden = true
        scrollView.snp.makeConstraints({ (make) in
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
        })
    }

    @IBAction func pressedAround(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func receiveData(result: [ProductOptionResponseResult], firstOptionList: [String]!, optionDictionary: [String : [String]]!) {
        contentInputView.receiveData(rootViewController: self, result: result, firstOptionList: firstOptionList, optionDictionary: optionDictionary)
        self.result = result
    }
    
    @IBAction func pressedPurchase(_ sender: Any) {
        rootViewController.navigationController!.navigationBar.frame = CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 160.0)
        rootViewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        rootViewController.navigationItem.backBarButtonItem?.tintColor = .black
        
        let nextViewController = OrderViewController()
        nextViewController.doneItem(data: itemList, price: itemPrice.text, count: itemCount.text, result: self.result, index: self.currentIndex)
        self.dismiss(animated: false, completion: nil)
        rootViewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
