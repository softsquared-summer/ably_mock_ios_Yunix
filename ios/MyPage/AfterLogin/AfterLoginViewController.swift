//
//  AfterLoginViewController.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import PMSuperButton

class AfterLoginViewController: UIViewController {

    @IBOutlet var threeButton: PMSuperButton!
    @IBOutlet var useNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        threeButton.clipsToBounds = true
        // Do any additional setup after loading the view.
        if !(userToken == nil) {
            useNameLabel.text = userName
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        view.removeFromSuperview()
        removeFromParent()
    }

    @IBAction func pressedSetting(_ sender: Any) {
        self.navigationController?.pushViewController(SettingViewController(), animated: true)
    }
    
    @IBAction func pressedOrderListButton(_ sender: Any) {
        self.navigationController?.pushViewController(OrderListViewController(), animated: true)
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
