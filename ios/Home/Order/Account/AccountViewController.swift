//
//  AccountViewController.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class AccountViewController: BaseViewController {

    @IBOutlet var bankTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var numberTextField: UITextField!
    
    var rootViewController: OrderViewController!
    var accountData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pressedDoneButton(_ sender: Any) {
        accountData.append(bankTextField.text!)
       accountData.append(nameTextField.text!)
       accountData.append(numberTextField.text!)
       rootViewController.doneAccount(data: accountData)
        self.navigationController?.popViewController(animated: true)
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
